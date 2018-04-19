/* 
Sketch for the Engineering Expo
Revised from the Final_Demo code
Pulled from Hans' code, and then Erik's code added to it.
Uses a photocell to control the brightness of the display, and 
should parse clock info from the GPS and update the display
to show the clock.

Written for Arduino 1.0
Last edited: 5-8-2012 by Erik Lane
*/ 

/*
  I2C Bridge initialization and testing code. This code will set
  up a SC16IS740 chip on the I2C port to transmit characters over
  its UART port in order to allow the Atmega328 to have two
  different UART ports to allow connection in our Heads Up
  Display.
  
  I had all kinds of issues with the Wire library included with
  the Arduino, and it looks like it comes down to the Arduino
  not supporting a repeated start condition on the bus before
  switching from writing to reading. Without that it looks like
  the bridge chip will not allow the register read to take place
  correctly. That is the assumption that I'm working under in
  making this new attempt to get it to work. The library being
  used is from:
  http://dsscircuits.com/articles/arduino-i2c-master-library.html
*/
#include "ht1632c.h"
#include "I2C.h"
#include "Regexp.h"

//address for I2C-serial bridge chip
const uint8_t address = 0x48;


//state machine modes
#define OBD_MPH_mode 0
#define OBD_RPM_mode 1
#define GPS_mode_speed 2
#define GPS_mode_clock 3
#define checkLightLevel 4
#define OBD_temp_mode 5
#define read_voltage_mode 6
#define read_MAF_mode 7
#define read_fuel_trim_mode 8
#define MaxPossibleState 8

#define encoderPushButton 3

#define time_offset 17

//light levels for the dimming of display
#define LightLevelLowMedium 200
#define LightLevelMediumHigh 500
#define LightLevelNullBand 50

/* encoder port */
#define ENC_CTL DDRB //encoder port control
#define ENC_WR PORTB //encoder port write
#define ENC_RD PINB //encoder port read
#define ENC_A 0 //encoder pin A PB0 (Arduino pin 8)
#define ENC_B 1 //encoder pin B PB1 (Arduino pin 9)

//volatile byte check = 0x00;

volatile boolean read_mode_change = true;

int8_t mirrored = 0; //0 is unmirrored, 30 is mirrored. 
// (the 3=m for mirrored)

/*
The registers in the bridge chip are addressed in a bit of a
funny way. Bit 7 and 0 are not used. Bits 6:3 correspond to
bits A3:0 of the register address. Bits 2:1 are not used, but
they are reserved and *NEED* to be set to 0 when addressing
the chip.

*/

// different variables just used to do things periodically without having
// to have a delay built into the code.
unsigned long time_now = 0;
unsigned long last_time_i2c = 0;
unsigned long last_time_led = 0;
unsigned long last_time_analog_read = 0;
unsigned long last_time_OBD = 0;
byte led_state = LOW;

MatchState ms;


// Just some variables so that mirroring will work well, and
// we don't have to edit constants all over if things change.
const int8_t x_pos[] = {1,7,13,19,25};
int8_t y1=0;
int8_t y2=9;

// Used to keep track of problems so we can reset the parser
// if necessary.
int8_t fail = 0;

const uint8_t clock_pos[] = {0,5,12,17,24,29};
uint8_t parse_state = 0;
byte char_count = 0;
int8_t read_byte = 0;
volatile char read_mode = 0;
uint16_t rpm = 0;
uint16_t maf = 0;
uint8_t mph = 0;
byte character=0;
//int testing = 0;
char received[61];
byte received_pos = 0;
int coolant_temp = 0;
volatile boolean menu_on = false;
//byte settings = 0;
#define max_menu_pos 3
// Used to keep track of the menu
volatile boolean selected = false;
volatile boolean increase_menu_num = false;
volatile boolean decrease_menu_num = false;
// User settings
boolean fahrenheit = true;
boolean miles = true;
// Let user select colors
byte value_color = GREEN;
byte label_color = RED;
uint8_t light_output = 16;
uint8_t scantools_protocol = 0;
unsigned int calibrated_voltage = 1260;
boolean verbose = false;
boolean data_complete = false;
char fuel_trim_to_send = '6';

ht1632c led = ht1632c(PORTD,4,5,6,7,GEOM_32x16,2);


#define photocellPin  0     // the cell and 4.7K pulldown are connected to a0
unsigned int photocellReading;     // the analog reading from the analog resistor divider

ISR(PCINT0_vect){
  if(selected!=1){
    static uint8_t old_AB = 3; //lookup table index and initial state
    uint8_t encport; //encoder port copy
    uint8_t direction1;
    static const int8_t enc_states [] PROGMEM = {0,-1,1,0,1,0,0,-1,-1,0,0,1,0,1,-1,0}; //encoder lookup table
    old_AB <<=2; //remember previous state
    encport = ENC_RD & 0x03; //read encoder
    old_AB |= encport; //create index
    direction1 = pgm_read_byte(&(enc_states[( old_AB & 0x0f )])); //get direction
    if( direction1 && ( encport == 3 )) { //check if at detent and transition is valid
      if( direction1 == 1 ) {
        if(menu_on){
          decrease_menu_num = true;
        }else{
          read_mode -= 1;
          if(read_mode < 0) read_mode = MaxPossibleState; //wrap around
          read_mode_change = true; // To signal the main loop to change the screen
        }
      }else {
        if(menu_on){
          increase_menu_num = true;
        } else {
          read_mode += 1;
          if(read_mode > MaxPossibleState) read_mode = 0; // wrap around
          read_mode_change = true; // To signal the main loop to change the screen
        }
      }
    }
  }
}

ISR(INT1_vect){
  static unsigned long last_interrupt_time = 0;
  unsigned long interrupt_time = millis();
  // If interrupts come faster than 200ms, assume it's a bounce and ignore
  if (interrupt_time - last_interrupt_time > 200){
    selected = true;
    menu_on = true;
  }
  last_interrupt_time = interrupt_time;
}
 
void setup(void) {
  led.clear();
  led.pwm(15);
  // Just a screen of orange dots at the start to make sure
  // everything is working.
  for(byte i=0; i<32; i++) {
    for (byte j=0; j<16; j++) {
      led.plot(i, j, ORANGE);
    }
  }
  led.sendframe();
  delay(500);
  for(byte i=0;i<60;i++){
    received[i]=0;
  }
  pinMode(encoderPushButton, INPUT);
  digitalWrite(encoderPushButton, HIGH);
  
  ENC_CTL &= ~(( 1<<ENC_A )|( 1<<ENC_B )); //inputs
  ENC_WR |= (( 1<<ENC_A )|( 1<<ENC_B )); //turn on pullups
  PCMSK0 |= (( 1<<PCINT0 )|( 1<<PCINT1 )); //enable encoder pins interrupt sources
  PCICR |= ( 1<<PCIE0 ); // enable pin change interupts
  EIMSK |= (1 << INT1);     // Enable external interrupt INT0
  EICRA |= (1 << ISC11);    // Trigger INT1 on falling edge

  pinMode(4, OUTPUT);
  pinMode(5, OUTPUT);
  pinMode(6, OUTPUT);
  pinMode(7, OUTPUT);
  pinMode(10, OUTPUT);
  Serial.begin(9600);
  delay(100);
  Serial.print("AT SP ");
  Serial.print(scantools_protocol);
  Serial.print("\r");
  led.clear();
  led.setfont(4);
  // Set up the defaults in case the clock doesn't start
  // at zero. Very unlikely, but it doesn't hurt to be sure.
  // This way these variables are set to a known value.
  time_now = millis();
  last_time_i2c = time_now;
  last_time_led = time_now;
  last_time_analog_read = time_now;
  last_time_OBD = time_now;

  // Start up the hardware
  I2c.begin();
  // 0x18 is the address for the Line Control Register. Need to
  // set it up to allow writing to the divisor registers to allow
  // the UART clock to be set up to run at the right speed.
  // 0x80 sets bit 7 to allow writing to DLL and DLH.
  I2c.write(address, (uint8_t)0x18, (uint8_t)0x80);
  
  // Now set register 0x00 so that we can set the divisor low
  // byte.
  // This line was for the slower crystal on demo board.
  //I2c.write(address, 0x00, 0x18);
  I2c.write(address, (uint8_t)0x00, (uint8_t)0x30);
  I2c.write(address, (uint8_t)0x08, (uint8_t)0x00);
  
  // Now set the LCR to 0x03 which is no parity, 1 stop bit, 8
  // data bits, and this will also set the registers back to
  // normal access, which will remove the possibility of changing
  // DLL and DLH
  I2c.write(address, (uint8_t)0x18, (uint8_t)0x03);
  
  // Set the FCR, address 0x10, to be 0x07 to clear both the
  // receive and transmit FIFOs and then to enable them.
  I2c.write(address, (uint8_t)0x10, (uint8_t)0x07);
  
  // Turn on interrupts for the receive buffer. IER is address
  // 0x08, and the bits for turning on the interrupts for the
  // receive are 2 and 0.
  I2c.write(address, (uint8_t)0x08, (uint8_t)0x05);
}

// Sinec the numbers are returned as ascii hexadecimal text,
// this will turn them into the equivalent int value from 0
// to 16.
int8_t convert_ascii(unsigned char input){
  if(input>='0' && input<='9'){
    return input-'0';
  }
  if(input>='A' && input<='F'){
    return input-'A'+10;
  }
  if(input>='a' && input<='f'){
    return input-'a'+10;
  }
  return -1;
}

// Read the clock data coming from the GPS through the
// I2C bridge chip.
void read_I2c_clock(void){
  uint8_t yd1 = 2;
  uint8_t yd2 = 4;
  if(mirrored){
    yd1 = 11;
    yd2 = 13;
  }
  I2c.read(address, (uint8_t)0x48, (uint8_t)1);
  uint8_t input = 0;
  while(I2c.available()){
    input=I2c.receive();
  }
  if(input>60){
    input=60;
  }
  if(input!=0){
    I2c.read(address, (uint8_t)0x00, input);
  }
  while(I2c.available()){
    character=(char)I2c.receive();
    if(character >= ' ' && character <= 'z'){
      received[received_pos]=character;
      received_pos=received_pos+1;
      if(received_pos>60)
        received_pos=0;
    }
  }
  received[received_pos]=0;
  ms.Target(received);
  char result = ms.Match("%$GPRMC,%d%d%d%d%d%d");
  if(result > 0){
    char hour1 = convert_ascii(received[ms.MatchStart+7]);
    char hour2 = convert_ascii(received[ms.MatchStart+8]);
    led.plot(10,yd2,value_color);
    led.plot(10,yd1,value_color);
    led.plot(22,yd1,value_color);
    led.plot(22,yd2,value_color);
    int8_t total = 10 * hour1 + hour2;
    // GPS time is Universal time, so change
    // it to be the local time.
    total += time_offset;
    if(total >= 24) total-=24;
    hour1 = total/10;
    hour2 = total%10;
    led.putchar(clock_pos[0],y1,hour1+'0',value_color,0);
    led.putchar(clock_pos[1],y1,hour2+'0',value_color,0);
    led.putchar(clock_pos[2],y1,received[ms.MatchStart+9],value_color,0);
    led.putchar(clock_pos[3],y1,received[ms.MatchStart+10],value_color,0);
    led.putchar(clock_pos[4],y1,received[ms.MatchStart+11],value_color,0);
    led.putchar(clock_pos[5],y1,received[ms.MatchStart+12],value_color,0);
    received_pos=0;
    data_complete=true;
  }
}
// Read the speed from the GPS over the I2C bridge.
void read_I2C_MPH(void){
  I2c.read(address, (uint8_t)0x48, (uint8_t)1);
  uint8_t input = 0;
  while(I2c.available()){
    input=I2c.receive();
  }
  if(input>60){
    input=60;
  }
  if(input!=0){
    I2c.read(address, (uint8_t)0x00, input);
  }
  while(I2c.available()){
    character=(char)I2c.receive();
    if(character >= ' ' && character <= 'z'){
      received[received_pos]=character;
      received_pos=received_pos+1;
      if(received_pos>60)
        received_pos=0;
    }
    // State machine to parse out the proper info
    // from the serial stream.
    switch(parse_state){
      case 0:
        if(character=='$'){
          parse_state=1;
        }
        received_pos = 1;
        break;
      case 1:
        if(character=='G'){
          parse_state=2;
        } else{
          parse_state=0;
        }
        break;
      case 2:
        if(character=='P'){
          parse_state=3;
        } else{
          parse_state=0;
        }
        break;
      case 3:
        if(character=='V'){
          parse_state=4;
        }else{
          parse_state=0;
        }
        break;
      case 4:
        if(character=='T'){
          parse_state=5;
        } else{
          parse_state=0;
        }
        break;
      case 5:
        if(character=='G'){
          parse_state=6;
        } else{
          parse_state=0;
        }
        break;
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
        if(character==','){
          parse_state=parse_state+1;
        }
        break;
      case 13:
        mph = 1000 * convert_ascii(character);
        parse_state=14;
        break;
      case 14:
        mph = mph + 100 * convert_ascii(character);
        parse_state=15;
        break;
      case 15:
        mph = mph + 10 * convert_ascii(character);
        parse_state=16;
        break;
      case 16:
        mph = mph + convert_ascii(character);
        // Only convert to miles per hour if miles=true
        // Otherwise keep in kilometers per hour
        if(miles)
          mph = (uint8_t)mph * 0.62137;
        parse_state=0;
        if(mph<0) mph = 0;
        led.putInt(y1,mph,value_color,false);
        led.sendframe();
        data_complete = true;
        received[received_pos] = 0;
    }
  }
}
// Read RPM through the Scantools chip from the car.
void OBD_RPM_read(void){
  int8_t check = 0;
  int8_t input = 0;
  input = Serial.available();
  if(input<0)
    input = 0;
  if(input>60)
    input = 60;
  for(uint8_t i=0;i<input;i++){
    character = Serial.read();
    if(character >= ' ' && character <= 'z'){
      received[received_pos]=character;
      received_pos=received_pos+1;
    }
    // State machine to read the data from the stream.
    switch(parse_state){
      case 0:
        if(character=='4'){
          parse_state=1;
        }
        received_pos = 1;
        break;
      case 1:
        if(character=='1'){
          parse_state=2;
        } else{
          parse_state=0;
        }
        break;
      case 2:
        if(character==' '){
          parse_state=3;
        } else{
          parse_state=0;
        }
        break;
      case 3:
        if(character=='0'){
          parse_state=4;
        }else{
          parse_state=0;
        }
        break;
      case 4:
        if(character=='C'){
          parse_state=5;
        } else{
          parse_state=0;
        }
        break;
      case 5:
        if(character==' '){
          rpm=0;
          parse_state=6;
        } else{
          parse_state=0;
        }
        break;
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
        parse_state=parse_state+1;
        check = convert_ascii(character);
        if(check==-1){
          fail=fail+1;
          if(fail>2){
            parse_state=0;
            rpm=0;
            fail=0;
          }
          break;
        }
        rpm = rpm << 4;
        rpm=rpm+check;
        if(parse_state<11){
          break;
        }
        rpm = rpm >> 2;
        led.putInt(y1,rpm,value_color,false);
        led.sendframe();
        parse_state=0;
        data_complete = true;
        received[received_pos] = 0;
    }
  }
}

// Read the speed through the Scantools chip from the car.
void OBD_MPH_read(void){
  int8_t check = 0;
  int8_t input = 0;
  input = Serial.available();
  if(input<0)
    input = 0;
  if(input>60)
    input = 60;
  for(uint8_t i=0;i<input;i++){
    character = Serial.read();
    if(character >= ' ' && character <= 'z'){
      received[received_pos]=character;
      received_pos=received_pos+1;
    }
  }
  received[received_pos]=0;
  ms.Target(received);
  char result = ms.Match("41 05 %x%x");//%x matches 
                                    //hexadecimal digits
  if(result > 0){
    mph = convert_ascii(received[ms.MatchStart+6])<<4;
    mph += convert_ascii(received[ms.MatchStart+7]);
    coolant_temp -= 40;
    if(miles)
      mph = (int)mph * 0.62137;
    led.putInt(y1,mph,value_color,false);
    led.sendframe();
    data_complete=true;
  }
}

// Read the coolant temp through the Scantools chip
// from the car.
void OBD_temp_read(void){
  int8_t check = 0;
  int8_t input = 0;
  input = Serial.available();
  if(input<0)
    input = 0;
  if(input>60)
    input = 60;
  for(uint8_t i=0;i<input;i++){
    character = Serial.read();
    if(character >= ' ' && character <= 'z'){
      received[received_pos]=character;
      received_pos=received_pos+1;
    }
  }
  received[received_pos]=0;
  ms.Target(received);
  char result = ms.Match("41 05 %x%x");//%x matches 
                                    //hexadecimal digits
  if(result > 0){
    coolant_temp = convert_ascii(received[ms.MatchStart+6])<<4;
    coolant_temp += convert_ascii(received[ms.MatchStart+7]);
    coolant_temp -= 40;
    if(fahrenheit){
      coolant_temp = (int)(coolant_temp * 1.8);
      coolant_temp = coolant_temp + 32;
    }
    led.putInt(y1,coolant_temp,value_color,true);
    if(fahrenheit){
      led.putchar(x_pos[4],y1,'F',value_color);
    }else{
      led.putchar(x_pos[4],y1,'C',value_color);
    }
    led.sendframe();
    data_complete=true;
  }
}
// Just to test the regex
void read_voltage(void){
  int8_t input = 0;
  input = Serial.available();
  if(input<0)
    input = 0;
  if(input+received_pos>60)
    input = 60-received_pos;
  for(uint8_t i=0;i<input;i++){
    character = Serial.read();
    received[received_pos]=character;
    received_pos=received_pos+1;
  }
  received[received_pos]=0;
  ms.Target(received);
  char result = ms.Match("%d?%d%.%dV");
  if(result > 0){
    for(uint8_t i = 0;i<ms.MatchLength-1;i++){
      led.putchar(x_pos[i+1],y1,received[i+ms.MatchStart],value_color);
    }
    led.sendframe();
    received_pos = 0;
    data_complete=true;
  }
}

void read_fuel_trim(void){
  int8_t input = 0;
  int fuel_trim;
  input = Serial.available();
  if(input<0)
    input = 0;
  if(input+received_pos>60)
    input = 60-received_pos;
  for(uint8_t i=0;i<input;i++){
    character = Serial.read();
    received[received_pos]=character;
    received_pos=received_pos+1;
  }
  received[received_pos]=0;
  ms.Target(received);
  char result = ms.Match("41 0%d %x%x");//%x matches 
                                    //hexadecimal digits
  if(result > 0){
    if(received[ms.MatchStart+4]==fuel_trim_to_send){
      fuel_trim = convert_ascii(received[ms.MatchStart+6])<<4;
      fuel_trim += convert_ascii(received[ms.MatchStart+7]);
      fuel_trim -= 128;
      fuel_trim *= 100;
      fuel_trim >>= 7;
      led.putInt(y1,fuel_trim,value_color,true);
      led.sendframe();
      received_pos = 0;
      data_complete=true;
    }
  }
}

void read_MAF(void){
  int8_t input = 0;
  int maf = 0;
  input = Serial.available();
  if(input<0)
    input = 0;
  if(input+received_pos>60)
    input = 60-received_pos;
  for(uint8_t i=0;i<input;i++){
    character = Serial.read();
    received[received_pos]=character;
    received_pos=received_pos+1;
  }
  received[received_pos]=0;
  ms.Target(received);
  char result = ms.Match("41 10 %x%x");//%x matches 
                                    //hexadecimal digits
  if(result > 0){
    maf = convert_ascii(received[ms.MatchStart+6])<<4;
    maf += convert_ascii(received[ms.MatchStart+7]);
    maf >> 1;
    maf -= 64;
    led.putInt(y1,maf,value_color,true);
    led.sendframe();
    received_pos = 0;
    data_complete=true;
  }
}

// Display the word "Menu" at the bottom of the screen.
void display_menu(void){
  display_label(" Menu");
}

void display_value(char * text){
  led.setfont(4+mirrored);
  led.putchar(x_pos[0],y1,text[0],value_color);
  led.putchar(x_pos[1],y1,text[1],value_color);
  led.putchar(x_pos[2],y1,text[2],value_color);
  led.putchar(x_pos[3],y1,text[3],value_color);
  led.putchar(x_pos[4],y1,text[4],value_color);
  led.sendframe();
}
void display_label(char * text){
  led.setfont(4+mirrored);
  led.putchar(x_pos[0],y2,text[0],label_color);
  led.putchar(x_pos[1],y2,text[1],label_color);
  led.putchar(x_pos[2],y2,text[2],label_color);
  led.putchar(x_pos[3],y2,text[3],label_color);
  led.putchar(x_pos[4],y2,text[4],label_color);
  led.sendframe();
}
// Reset the screen depending on what is now going
// to be shown.
void changeFunction(void){
  led.clear();
  parse_state=0;
  delay(100);
  switch(read_mode){
    case OBD_MPH_mode:
    case GPS_mode_speed:
      if(miles)
        display_label(" MPH ");
      else
        display_label(" KPH ");
      led.setfont(1+mirrored);
      char source;
      if(read_mode==OBD_MPH_mode)
        source = 'c';
      else
        source = 'g';
      led.putchar(x_pos[4]+4,y2,source,label_color);
      led.setfont(4+mirrored);
      led.sendframe();
      break;
    case OBD_RPM_mode:
      display_label(" RPM ");
      break;
    case GPS_mode_clock:led.clear();
      led.setfont(1+mirrored);
      led.putchar(0,y2,'G',label_color);
      led.putchar(4,y2,'P',label_color);
      led.putchar(8,y2,'S',label_color);
      led.putchar(13,y2,'C',label_color);
      led.putchar(17,y2,'l',label_color);
      led.putchar(21,y2,'o',label_color);
      led.putchar(25,y2,'c',label_color);
      led.putchar(29,y2,'k',label_color);
      break;
    case checkLightLevel:
      display_label("Light");
      break;
    case OBD_temp_mode:
      display_label(" Temp");
      break;
    case read_voltage_mode:
      display_label("Volts");
      break;
    case read_MAF_mode:
      display_label(" MAF ");
      break;
    case read_fuel_trim_mode:
      display_label("FTB  ");
      if(fuel_trim_to_send=='6'||fuel_trim_to_send=='7'){
        led.putchar(x_pos[3],y2,'1',label_color);
      }else{
        led.putchar(x_pos[3],y2,'2',label_color);
      }
      if(fuel_trim_to_send=='6'||fuel_trim_to_send=='8'){
        led.putchar(x_pos[4],y2,'S',label_color);
      }else{
        led.putchar(x_pos[4],y2,'L',label_color);
      }
      led.sendframe();
      break;
  }
}

// Let the user select between different options and
// settings. This is done with a state machine.
void main_menu(void){
  static uint8_t menu_state = 0;
  static int8_t display_protocol = scantools_protocol;
  int8_t input = 0;
  static char text[20];
  static uint8_t text_pos = 0;
  if(menu_state == 0){
    selected = true;
  }
  if(selected || increase_menu_num || decrease_menu_num){
    switch(menu_state){
      // Default state
      case 0:
        menu_state = 1;
        break;
      // Prompt to exit menu
      case 1:
        if(selected){
          menu_on = false;
          menu_state = 0;
          read_mode_change = true;
        }else if(increase_menu_num){
          menu_state = 2;
        }else if(decrease_menu_num){
          menu_state = 33;
        }
        break;
      // Select what units for temperature.
      case 2:
        if(selected){
          if(fahrenheit){
            menu_state = 4;
          }else{
            menu_state = 3;
          }
        }else if(increase_menu_num){
          menu_state = 5;
        }else if(decrease_menu_num){
          menu_state = 1;
        }
        break;
      // Celsius
      case 3:
        if(selected){
          fahrenheit = false;
          menu_state = 2;
        }else{
          menu_state = 4;
        }
        break;
      // Fahrenheit
      case 4:
        if(selected){
          fahrenheit = true;
          menu_state = 2;
        }else{
          menu_state = 3;
        }
        break;
      // Select units for speed
      case 5:
        if(selected){
          if(miles){
            menu_state = 7;
          }else{
            menu_state = 6;
          }
        }else if(increase_menu_num){
          menu_state = 8;
        }else if(decrease_menu_num){
          menu_state = 2;
        }
        break;
      // Kilometers
      case 6:
        if(selected){
          miles = false;
          menu_state = 5;
        }else{
          menu_state = 7;
        }
        break;
      // Miles
      case 7:
        if(selected){
          miles = true;
          menu_state = 5;
        }else{
          menu_state = 6;
        }
        break;
      // Choose display color
      case 8:
        if(selected){
          menu_state = 9;
        }else if(increase_menu_num){
          menu_state = 17;
        }else if(decrease_menu_num){
          menu_state = 5;
        }
        break;
      // Choose value display color
      case 9:
        if(selected){
          menu_state = 10 + value_color;
        }else{
          menu_state = 10;
        }
        break;
      // Choose label display color
      case 10:
        if(selected){
          menu_state = 13 + label_color;
        }else{
          menu_state = 9;
        }
        break;
      // value = GREEN
      case 11:
        if(selected){
          value_color = GREEN;
          menu_state = 8;
        }else if(increase_menu_num){
          menu_state = 12;
        }else if(decrease_menu_num){
          menu_state = 13;
        }
        break;
      // value = RED
      case 12:
        if(selected){
          value_color = RED;
          menu_state = 8;
        }else if(increase_menu_num){
          menu_state = 13;
        }else if(decrease_menu_num){
          menu_state = 11;
        }
        break;
      // value = ORANGE
      case 13:
        if(selected){
          value_color = ORANGE;
          menu_state = 8;
        }else if(increase_menu_num){
          menu_state = 11;
        }else if(decrease_menu_num){
          menu_state = 12;
        }
        break;
      // label = GREEN
      case 14:
        if(selected){
          label_color = GREEN;
          menu_state = 8;
        }else if(increase_menu_num){
          menu_state = 15;
        }else if(decrease_menu_num){
          menu_state = 16;
        }
        break;
      // label = RED
      case 15:
        if(selected){
          label_color = RED;
          menu_state = 8;
        }else if(increase_menu_num){
          menu_state = 16;
        }else if(decrease_menu_num){
          menu_state = 14;
        }
        break;
      // label = ORANGE
      case 16:
        if(selected){
          label_color = ORANGE;
          menu_state = 8;
        }else if(increase_menu_num){
          menu_state = 14;
        }else if(decrease_menu_num){
          menu_state = 15;
        }
        break;
      // Set light output level
      case 17:
        if(selected){
          menu_state = 18;
        }else if(increase_menu_num){
          menu_state = 19;
        }else if(decrease_menu_num){
          menu_state = 8;
        }
        break;
      // Actually select the light output level
      case 18:
        if(selected){
          menu_state = 17;
        }else if(increase_menu_num){
          if(light_output == 16){
            light_output = 0;
          }else{
            light_output = light_output + 1;
            led.pwm(light_output-1);
          }
        }else if(decrease_menu_num){
          if(light_output == 1){
            light_output = 0;
          }else if(light_output == 0){
            light_output = 16;
            led.pwm(light_output-1);
          }else{
            light_output = light_output - 1;
            led.pwm(light_output-1);
          }
        }
        break;
      // Switch between mirrored and normal.
      case 19:
        if(selected){
          if(mirrored){
            mirrored = 0;
          }else{
            mirrored = 30;
          }
          int temp = y1;
          y1 = y2;
          y2 = temp;
        }else if(increase_menu_num){
          menu_state = 20;
        }else if(decrease_menu_num){
          menu_state = 17;
        }
        break;
      // OBD protocol
      case 20:
        if(selected){
          menu_state = 21;
        }else if(increase_menu_num){
          menu_state = 22;
        }else if(decrease_menu_num){
          menu_state = 19;
        }
        display_protocol = scantools_protocol;
        break;
      // Select the OBD protocol to use.
      case 21:
        if(selected){
          scantools_protocol = display_protocol;
          Serial.write("AT SP ");
          if(scantools_protocol < 10){
            char c = '0' + scantools_protocol;
            Serial.print(c);
            Serial.print("\r");
          }else{
            char c = 'A'-10 + scantools_protocol;
            Serial.print(c);
            Serial.print("\r");
          }
          menu_state = 20;
        }else if(increase_menu_num){
          display_protocol += 1;
          if(display_protocol > 15){
            display_protocol = 0;
          }
        }else if(decrease_menu_num){
          display_protocol -= 1;
          if(display_protocol < 0){
            display_protocol = 15;
          }
        }
        break;
      // Voltage Calibration
      case 22:
        if(selected){
          menu_state = 23;
        }else if(increase_menu_num){
          menu_state = 24;
        }else if(decrease_menu_num){
          menu_state = 20;
        }
        break;
      // Pick what the calibrated value should be.
      case 23:
        if(selected){
          Serial.write("AT CV ");
          Serial.print(calibrated_voltage);
          Serial.print("\r");
          menu_state = 22;
        }else if(increase_menu_num){
          calibrated_voltage += 1;
          if(calibrated_voltage > 1999){
            calibrated_voltage = 600;
          }
        }else if(decrease_menu_num){
          calibrated_voltage -= 1;
          if(calibrated_voltage < 600){
            calibrated_voltage = 1999;
          }
        }
        break;
      // Read fault codes
      case 24:
        if(selected){
          Serial.print("03");
          Serial.print("\r");
          delay(1000);
          menu_state = 25;
        }else if(increase_menu_num){
          menu_state = 26;
        }else if(decrease_menu_num){
          menu_state = 22;
        }
        break;
      // This one actually reads and displays the 
      // fault codes from the OBD.
      case 25:
        if(selected){
          menu_state = 24;
        }else if(increase_menu_num || decrease_menu_num){
          Serial.print("03");
          Serial.print("\r");
          delay(1000);
        }
        break;
      // Clear codes menu selection
      case 26:
        if(selected){
          menu_state = 27;
        }else if(increase_menu_num){
          menu_state = 28;
        }else if(decrease_menu_num){
          menu_state = 24;
        }
        break;
      // Double check, then clear the codes.
      case 27:
        if(selected){
          Serial.print("04");
          Serial.print("\r");
          menu_state = 26;
        }else{
          menu_state = 26;
        }
        break;
      // Verbosity menu item
      case 28:
        if(selected){
          if(verbose){
            menu_state = 30;
          }else{
            menu_state = 29;
          }
        }else if(increase_menu_num){
          menu_state = 31;
        }else if(decrease_menu_num){
          menu_state = 26;
        }
        break;
      // Verbose off
      case 29:
        if(selected){
          verbose = false;
          menu_state = 28;
        }else{
          menu_state = 30;
        }
        break;
      // Verbose on
      case 30:
        if(selected){
          verbose = true;
          menu_state = 28;
        }else{
          menu_state = 29;
        }
        break;
      // Reset Scantools chip menu item.
      case 31:
        if(selected){
          menu_state = 32;
        }else if(increase_menu_num){
          menu_state = 33;
        }else if(decrease_menu_num){
          menu_state = 28;
        }
        break;
      // Double check, then send the reset command.
      case 32:
        if(selected){
          menu_state = 31;
          Serial.print("AT Z");
          Serial.print("\r");
        }else{
          menu_state = 31;
        }
        break;
      case 33:
        if(selected){
          menu_state = 34;
        }else if(increase_menu_num){
          menu_state = 1;
        }else if(decrease_menu_num){
          menu_state = 31;
        }
        break;
      case 34:
        if(selected){
          menu_state = 33;
        }else if(increase_menu_num){
          fuel_trim_to_send +=1;
          if(fuel_trim_to_send>'9'){
            fuel_trim_to_send = '6';
          }
        }else if(decrease_menu_num){
          fuel_trim_to_send -=1;
          if(fuel_trim_to_send<'6'){
            fuel_trim_to_send = '9';
          }
        }
        break;
    }
    delay(100); // just for debouncing
    selected = false;
    increase_menu_num = false;
    decrease_menu_num = false;
    led.setfont(4+mirrored);
    led.clear();
    switch(menu_state){
      case 0:
        if(menu_on){
          menu_state = 1;
        }else{
          break;
        }
        // No break statement so that it will also run the code under case 1
        // to display the exit message.
      case 1:
        display_menu();
        display_value("Exit>");
        break;
      case 2:
        display_menu();
        display_value("Temp.");
        break;
      case 3:
      case 4:
        if(menu_state == 3){
          led.putchar(x_pos[2],y1,'C',value_color);
        }else{
          led.putchar(x_pos[2],y1,'F',value_color);
        }
        display_label("Temp.");
        break;
      case 5:
        display_menu();
        display_value("Speed");
        break;
      case 6:
      case 7:
        if(menu_state == 6){
          led.putchar(x_pos[2],y1,'K',value_color);
        }else{
          led.putchar(x_pos[2],y1,'M',value_color);
        }
        display_label("Speed");
        break;
      case 8:
        display_menu();
        display_value("Color");
        break;
      case 9:
      case 10:
        if(menu_state == 9){
          display_value("Value");
        }else{
          display_value("Label");
        }
        display_label("Color");
        break;
      case 11:
        value_color = GREEN;
        display_value("Green");
        display_label("Value");
        break;
      case 12:
        value_color = RED;
        display_value(" Red ");
        display_label("Value");
        break;
      case 13:
        value_color = ORANGE;
        display_value("Orng.");
        display_label("Value");
        break;
      case 14:
        label_color = GREEN;
        display_value("Label");
        display_label("Green");
        break;
      case 15:
        label_color = RED;
        display_value("Label");
        display_label(" Red ");
        break;
      case 16:
        label_color = ORANGE;
        display_value("Label");
        display_label("Orng.");
        break;
      case 17:
        display_menu();
        display_value("Light");
        break;
      case 18:
        if(!light_output){
          display_value("Auto ");
        }else{
          led.putInt(y1, light_output, value_color,false);
        }
        display_label("Light");
        break;
      case 19:
        display_menu();
        display_value("Mirr.");
        break;
      case 20:
        display_menu();
        display_value("Prtcl");
        break;
      case 21:
        led.putInt(y1, display_protocol, value_color,false);
        display_label("Prtcl");
        break;
      case 22:
        display_menu();
        display_value("V Cal");
        break;
      case 23:
        led.putInt(y1,calibrated_voltage,value_color,false);
        display_label("V Cal");
        break;
      case 24:
        display_menu();
        display_value("Rd Cd");
        break;
      case 25:
        display_label("Rd Cd");
        input = Serial.available();
        received_pos = 0;
        if(input<0)
          input = 0;
        if(input>60)
          input = 60;
        for(uint8_t i=0;i<input;i++){
          character = Serial.read();
          received[received_pos]=character;
          received_pos=received_pos+1;
        }
        received[received_pos] = 0; // Null termination
        received_pos = 0;
        led.hscrolltext(y1, (char*)received, value_color, 25);
        led.putchar(0,y1,' ',BLACK);
        led.sendframe();
        break;
      case 26:
        display_menu();
        display_value("ClrCd");
        break;
      case 27:
        display_value("Sure?");
        display_label("ClrCd");
        break;
      case 28:
        display_menu();
        display_value("Vrbos");
        break;
      case 29:
      case 30:
        if(menu_state == 29){
          display_value(" No  ");
        }else{
          display_value(" Yes ");
        }
        display_label("Vrbos");
        break;
      case 31:
        display_menu();
        display_value("RstCp");
        break;
      case 32:
        display_value("Sure?");
        display_label("RstCp");
        break;
      case 33:
        display_menu();
        display_value("Fl Tr");
        break;
      case 34:
        display_value("FTB  ");
        if(fuel_trim_to_send=='6'||fuel_trim_to_send=='7'){
          led.putchar(x_pos[3],y1,'1',value_color);
        }else{
          led.putchar(x_pos[3],y1,'2',value_color);
        }
        if(fuel_trim_to_send=='6'||fuel_trim_to_send=='8'){
          led.putchar(x_pos[4],y1,'S',value_color);
        }else{
          led.putchar(x_pos[4],y1,'L',value_color);
        }
        display_label("Fl Tr");
        break;
    }
    led.sendframe();
  }
}

// Main loop. Everything is handled here.
void loop(void) {
  if (read_mode_change){
    read_mode_change=false;
    changeFunction();
  }
  // If the menu is on goto it, otherwise go to the 
  // function that is set as the read mode.
  if(menu_on){
    main_menu();
  }else switch(read_mode){
    case OBD_RPM_mode:
      OBD_RPM_read();
      break;
    case GPS_mode_speed:
      read_I2C_MPH();
      break;
    case OBD_MPH_mode:
      OBD_MPH_read();
      break;
    case GPS_mode_clock:
      read_I2c_clock();
      break;
    case OBD_temp_mode:
      OBD_temp_read();
      break;
    case read_voltage_mode:
      read_voltage();
      break;
    case read_MAF_mode:
      read_MAF();
      break;
    case read_fuel_trim_mode:
      read_fuel_trim();
      break;
  }
  // Get the current time to see if it's time yet to do
  // any of the actions.
  time_now = millis();
  if(!menu_on){
    if(read_mode==OBD_RPM_mode){
      if((time_now-last_time_OBD)>200){
        Serial.print("01 0C");
        // Make sure to only do the carriage return ("\r")
        // because otherwise the Scantools chip gets confused
        // and most protocols just silently fail.
        Serial.print("\r");
        last_time_OBD = time_now;
        received_pos=0;
      }
    }
    if(read_mode==OBD_MPH_mode){
      if((time_now-last_time_OBD)>200){
        Serial.print("01 0D");
        Serial.print("\r");
        last_time_OBD = time_now;
        received_pos=0;
      }
    }
    if(read_mode==OBD_temp_mode){
      if((time_now-last_time_OBD)>200){
        Serial.print("01 05");
        Serial.print("\r");
        last_time_OBD = time_now;
        received_pos=0;
      }
    }
    if(read_mode==read_voltage_mode){
      if((time_now-last_time_OBD)>200){
        Serial.print("AT RV");
        Serial.print("\r");
        last_time_OBD = time_now;
        received_pos=0;
      }
    }
    if(read_mode==read_MAF_mode){
      if((time_now-last_time_OBD)>200){
        Serial.print("01 10");
        Serial.print("\r");
        last_time_OBD = time_now;
        received_pos = 0;
      }
    }
    if(read_mode==read_fuel_trim_mode){
      if((time_now-last_time_OBD)>200){
        Serial.print("01 0");
        Serial.print(fuel_trim_to_send);
        Serial.print("\r");
        last_time_OBD = time_now;
        received_pos = 0;
      }
    }
  }
  // Toggle the led every 1/2 second.
  if((time_now-last_time_led)>500){
    if(led_state==LOW){
      led_state=HIGH;
    }
    else {
      led_state=LOW;
    }
    digitalWrite(10, led_state);
    last_time_led=time_now;
  }
  // when light_output = 0 then output is automatic
  
  if((time_now-last_time_analog_read)>100){
    static uint8_t last_light_reading = 0;
    photocellReading = analogRead(photocellPin);  
    last_time_analog_read=time_now;
    if(!menu_on && read_mode == checkLightLevel){
      led.putInt(y1,photocellReading,value_color,false);
    }
    if(!light_output){
      if(photocellReading<60){
        led.pwm(0);
      }else{
        // divide by 64 to turn 1024 levels into 16 levels
        photocellReading = photocellReading >> 6;
        if(photocellReading != last_light_reading){
          last_light_reading = photocellReading;
          led.pwm(photocellReading);
        }
      }
    }
  }
  if(verbose && !menu_on && data_complete){
    led.hscrolltext(y2, (char*)received, value_color, 25);
    data_complete = false;
    delay(1000);
  }
}
