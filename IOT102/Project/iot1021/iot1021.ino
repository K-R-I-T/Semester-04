#include "SevSeg.h"
SevSeg Display;
const unsigned int period = 1000;
const unsigned int ledPeriod = 500;
unsigned long startMillis;
unsigned long ledStartMillis;
unsigned long currentMillis;
unsigned long ledCurrentMillis;
const int hrsButton = A0;
const int minButton = A1;
const int ledPin = A2;
int hrs = 24;
int min = 0;
int sec = 0;
int Time;
int ledState = LOW;

void setup()
{
  pinMode(hrsButton, INPUT_PULLUP);
  pinMode(minButton, INPUT_PULLUP);
  pinMode(ledPin, OUTPUT);
  digitalWrite(ledPin, HIGH);
  startMillis = 0;
  ledStartMillis = 0;
  byte numDigits = 4;
  byte digitPins[] = {10, 11, 12, 13};
  byte segmentPins[] = {2, 3, 4, 5, 6, 7, 8, 9};
  bool registorsOnSegment = false;
  bool updateWithDelaysIn = false;
  bool leadingZeros = true;
  bool disableDecPoint = true;
  byte hardwareConfig = COMMON_ANODE;
  Display.begin(hardwareConfig, numDigits, digitPins, segmentPins, registorsOnSegment, updateWithDelaysIn, leadingZeros, disableDecPoint);
  Display.setBrightness(100);
}

void loop()
{
  currentMillis = millis();
  if (currentMillis - startMillis >= period) {
    sec++;
    startMillis = currentMillis;
  }
  ledCurrentMillis = millis();
  if (ledCurrentMillis - ledStartMillis >= ledPeriod) {
    ledStartMillis = ledCurrentMillis;
    if (ledState == LOW) {
      ledState = HIGH;
      if (digitalRead(hrsButton) == LOW) {
        hrs++;
      }
      if (digitalRead(minButton) == LOW) {
        min++;
      }
    } else {
      ledState = LOW;
    }
    digitalWrite(ledPin, ledState);
  }
  if (sec == 60) {
    sec = 0;
    min++;
  }
  if (min == 60) {
    min = 0;
    hrs++;
  }
  if (hrs == 25) {
    hrs = 1;
  }
  Time = hrs * 100 + min;
  Display.setNumber(Time);
  Display.refreshDisplay();
}
