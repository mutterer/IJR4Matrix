/*
  This sketch is modified from the "live preview" example sketch
  Reads 12 bytes from the serial port
  Updates the LED Matrix accordingly
  Works with LED MAtrix editor at https://github.com/mutterer/IJR4Matrix/
*/

#include "Arduino_LED_Matrix.h"

ArduinoLEDMatrix matrix;

uint32_t frame[] = {
 0x3fc40299, 0x98019098, 0xf14033fc 
};

void setup() {
  Serial.begin(9600);
  matrix.begin();
  matrix.loadFrame(frame);
}

void loop() {
  if(Serial.available() >= 12){
    frame[0] = Serial.read() << 24 | Serial.read() << 16 | Serial.read() << 8 | Serial.read() ;
    frame[1] = Serial.read() << 24 | Serial.read() << 16 | Serial.read() << 8 | Serial.read() ;
    frame[2] = Serial.read() << 24 | Serial.read() << 16 | Serial.read() << 8 | Serial.read() ;
    matrix.loadFrame(frame);
  }
}

