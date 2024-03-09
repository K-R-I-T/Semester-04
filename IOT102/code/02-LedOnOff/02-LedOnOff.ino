int ledPin = 13;
String cmd = "";

void setup() {
  pinMode(ledPin, OUTPUT);
  Serial.begin(9600);
  digitalWrite(ledPin, LOW);
}

void loop() {
  if (Serial.available()) {
    cmd = Serial.readStringUntil('\n');
    if (cmd == "ON") {
      digitalWrite(ledPin, HIGH);
      Serial.println("LED is " + cmd);
    }
    if (cmd == "OFF") {
      digitalWrite(ledPin, LOW);
      Serial.println("LED is " + cmd);
    }
  }
}
