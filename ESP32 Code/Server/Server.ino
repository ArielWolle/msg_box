/*
  SimpleMQTTClient.ino
  The purpose of this exemple is to illustrate a simple handling of MQTT and Wifi connection.
  Once it connects successfully to a Wifi network and a MQTT broker, it subscribe to a topic and send a message to it.
  It will also send a message delayed 5 seconds later.
*/
#include <Adafruit_NeoPixel.h>
#include <RunningMedian.h>
#include <EEPROM.h>
#include "EspMQTTClient.h"


Adafruit_NeoPixel strip = Adafruit_NeoPixel(64, 16, NEO_GRB + NEO_KHZ800);

TaskHandle_t buttonSet;

int list_simpleHeart[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0};


int currentTime = millis();
const int timeDifference = 1 * 1000;
int lastTime = millis() - timeDifference;

int button1Pin = 4;
RunningMedian button1Data = RunningMedian(4);
int maxButton1Data = 0;
int button1Value = 0;

int button2Pin = 13;
RunningMedian button2Data = RunningMedian(4);
int maxButton2Data = 0;
int button2Value = 0;

int button3Pin = 2;
RunningMedian button3Data = RunningMedian(4);
int maxButton3Data = 0;
int button3Value = 0;

int button4Pin = 15;
RunningMedian button4Data = RunningMedian(4);
int maxButton4Data = 0;
int button4Value = 0;



#define CONFIG_START 32        // position in EEPROM where our first byte gets written
#define CONFIG_VERSION "00001" // version string to let us compare current to whatever is in EEPROM


EspMQTTClient client;

typedef struct {
  char version[6];      // Version of the configuration in EEPROM, used in case we change the struct
  uint8_t debug;        // Debug on yes/no 1/0
  char nodename[32];    // this node name
  char ssid[32];        // WiFi SSID
  char password[64];    // WiFi Password
  char mqttip[32];      // Mosquitto server IP
  uint16_t mqttport;    // Mosquitto port
  char mqttuser[32];    // Mosquitto Username (if needed, or "")
  char mqttpass[64];    // Moqsuitto Password (if needed, or "")
} configuration_t;

configuration_t CONFIGURATION = {
  CONFIG_VERSION,
  1,
  "TestClient",
  "oogie",
  "15277251TAD",
  "173.230.138.220",
  1883,
  "",
  ""
};



int loadConfig() {
  // validate its the correct version (and therefore the same struct...)
  if (EEPROM.read(CONFIG_START + 0) == CONFIG_VERSION[0] &&
      EEPROM.read(CONFIG_START + 1) == CONFIG_VERSION[1] &&
      EEPROM.read(CONFIG_START + 2) == CONFIG_VERSION[2] &&
      EEPROM.read(CONFIG_START + 3) == CONFIG_VERSION[3] &&
      EEPROM.read(CONFIG_START + 4) == CONFIG_VERSION[4]) {
    // and if so read configuration into struct
    EEPROM.get(CONFIG_START, CONFIGURATION);
    return 1;
  }
  return 0;
}

void saveConfig() {
  EEPROM.put(CONFIG_START, CONFIGURATION);
  EEPROM.commit();
}

void button1AddData() {
  button1Data.add(touchRead(button1Pin)); ;
  if (maxButton1Data < button1Data.getMedian())
    maxButton1Data = button1Data.getMedian();
}

int button1Check() {
  if (button1Data.getMedian() < maxButton1Data - 20) {
    Serial.print("Task2 running on core ");
  Serial.println(xPortGetCoreID());
    button1Value = 1;
    return (1);
  }
  return (0);
}

void button2AddData() {
  button2Data.add(touchRead(button2Pin)); ;
  if (maxButton2Data < button2Data.getMedian())
    maxButton2Data = button2Data.getMedian();
}

int button2Check() {
  if (button2Data.getMedian() < maxButton2Data - 20) {
    button2Value = 1;
    return (1);
  }
  return (0);
}

void button3AddData() {
  button3Data.add(touchRead(button3Pin)); ;
  if (maxButton3Data < button3Data.getMedian())
    maxButton3Data = button3Data.getMedian();
}
int button3Check() {
  if (button3Data.getMedian() < maxButton3Data - 20) {
    button3Value = 1;
    return (1);
  }
  return (0);
}

void button4AddData() {
  button4Data.add(touchRead(button4Pin)); ;
  if (maxButton4Data < button4Data.getMedian())
    maxButton4Data = button4Data.getMedian();
}

int button4Check() {
  if (button4Data.getMedian() < maxButton4Data - 20) {
    button4Value = 1;
    return (1);
  }
  return (0);
}

void buttonSetter(void * parameter) {
  while (1) {
    button1AddData();
    button2AddData();
    button3AddData();
    button4AddData();
    if (millis() - lastTime > timeDifference) {
      if (button1Check() || button2Check() || button3Check() || button4Check()) {
        Serial.println("TOUCH DETTECTED");
        lastTime = millis();
      }
    }
  }
}

void buttonChecks() {
  if (button1Value) {
    button1Value = 0;
    client.publish("mytopic/test2", "button1");
  }
  else if (button2Value) {
    button2Value = 0;
    client.publish("mytopic/test2", "button2");
  }
  else if (button3Value) {
    button3Value = 0;
    client.publish("mytopic/test2", "button3");
  }
  else if (button4Value) {
    button4Value = 0;
    client.publish("mytopic/test2", "button4");
  }
}

void setup()
{
  Serial.begin(115200);
  EEPROM.begin(sizeof(configuration_t) + CONFIG_START);
  if (!loadConfig()) {
    saveConfig();
  }
  // enable debug messages if our configuration tells us to
  if (CONFIGURATION.debug)
    client.enableDebuggingMessages();

  client.setWifiCredentials(CONFIGURATION.ssid, CONFIGURATION.password);
  client.setMqttClientName(CONFIGURATION.nodename);
  client.setMqttServer(CONFIGURATION.mqttip, CONFIGURATION.mqttuser, CONFIGURATION.mqttpass, CONFIGURATION.mqttport);
  EEPROM.end();
  xTaskCreatePinnedToCore(
      buttonSetter, /* Function to implement the task */
      "Buttonset", /* Name of the task */
      10000,  /* Stack size in words */
      NULL,  /* Task input parameter */
      0,  /* Priority of the task */
      &buttonSet,  /* Task handle. */
      0); /* Core where the task should run */
  strip.begin();
  strip.setBrightness(20);
  strip.show(); // Initialize all pixels to 'off'
  // Optionnal functionnalities of EspMQTTClient :
  client.enableHTTPWebUpdater(); // Enable the web updater. User and password default to values of MQTTUsername and MQTTPassword. These can be overrited with enableHTTPWebUpdater("user", "password").
  client.enableLastWillMessage("TestClient/lastwill", "I am going offline");  // You can activate the retain flag by setting the third parameter to true
}

void simpleHeart() {
  int counter = 0;
  for (int f = 0; f < 2; f++) {
    for (int j = 0; j < 256; j++) {
      for (int i = 0; i < strip.numPixels(); i++) {
        buttonChecks();
        if (list_simpleHeart[i]) {
          if (j < 256 / 2 && f == 0) {
            strip.setPixelColor(i, strip.Color(255, j, int(256 / 2)));
          }
          else if (j > 256 / 2 && f == 0) {
            strip.setPixelColor(i, strip.Color(255, int(256 / 2), j));
          }
          else if (j < 256 / 2 && f == 1) {
            strip.setPixelColor(i, strip.Color(255, int(256 / 2), 255 - j));
          }
          else if (j > 256 / 2 && f == 1) {
            strip.setPixelColor(i, strip.Color(255, 256 - j, int(256 / 2)));
          }
        }
      }
      strip.show();
      delay(10);
      counter += 0.01;
    }
  }
  for (int j = 0; j < 255; j++) {
    for (int i = 0; i < strip.numPixels(); i++) {
      buttonChecks();
      if (list_simpleHeart[i]) {
        strip.setPixelColor(i, strip.Color(255 - j, 0, int(256 / 2 - j / 2)));
      }
    }
    strip.show();
    delay(10);
  }
}



// This function is called once everything is connected (Wifi and MQTT)
// WARNING : YOU MUST IMPLEMENT IT IF YOU USE EspMQTTClient
void onConnectionEstablished()
{
  // Subscribe to "mytopic/test" and display received message to Serial
  client.subscribe("mytopic/test", [](const String & payload) {
    simpleHeart();
  });

  // Subscribe to "mytopic/wildcardtest/#" and display received message to Serial
  client.subscribe("mytopic/wildcardtest/#", [](const String & topic, const String & payload) {
    Serial.println("(From wildcard) topic: " + topic + ", payload: " + payload);
  });

}





void loop()
{
  client.loop();
  buttonChecks();
}
