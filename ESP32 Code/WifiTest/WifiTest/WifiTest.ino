#include <WiFi.h>
#include <HTTPClient.h>
#include <WebServer.h>
#include <EEPROM.h>

#include <Adafruit_NeoPixel.h>
#include <EEPROM.h>
#include <PubSubClient.h>




Adafruit_NeoPixel strip = Adafruit_NeoPixel(64, 16, NEO_GRB + NEO_KHZ800);

TaskHandle_t buttonSet;

int list_simpleHeart[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0};


int currentTime = millis();
const int timeDifference = 1 * 1000;
int lastTime = millis() - timeDifference;

int button1Pin = 4;
int button1Value = 0;

int button2Pin = 13;
int button2Value = 0;

int button3Pin = 2;
int button3Value = 0;




//Variables
int i = 0;
int statusCode;
const char* ssid = "Default SSID";
const char* passphrase = "Default passord";
String st;
String content;
String esid;
String epass = "";


//Function Decalration
bool testWifi(void);
void launchWeb(void);
void setupAP(void);

//Establishing Local server at port 80
WebServer server(80);

WiFiClient espClient;
PubSubClient client(espClient);

const char* mqtt_server = "173.230.138.220";





int button1Check() {
  if (digitalRead(button3Pin) ==1) {
    button1Value = 1;
    return (1);
  }
  return (0);
}


int button2Check() {
  if (digitalRead(button2Pin) ==1) {
    button2Value = 1;
    return (1);
  }
  return (0);
}

int button3Check() {
  if (digitalRead(button3Pin) == 1) {
    button3Value = 1;
    return (1);
  }
  return (0);
}


void buttonSetter(void * parameter) {
  while (1) {
    if (millis() - lastTime > timeDifference) {
      if (button1Check() || button2Check() || button3Check()) {
        Serial.println("TOUCH DETTECTED");
        lastTime = millis();
      }
    }
    delay(1);
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
}
void setup()
{

  Serial.begin(115200); //Initialising if(DEBUG)Serial Monitor
  Serial.println();
  Serial.println("Disconnecting current wifi connection");
  WiFi.disconnect();
  WiFi.setHostname("Love_Boxes");
  EEPROM.begin(512); //Initialasing EEPROM
  delay(10);
  pinMode(15, INPUT);
  Serial.println();
  Serial.println();
  Serial.println("Startup");

  //---------------------------------------- Read eeprom for ssid and pass
  Serial.println("Reading EEPROM ssid");


  for (int i = 0; i < 32; ++i)
  {
    esid += char(EEPROM.read(i));
  }
  Serial.println();
  Serial.print("SSID: ");
  Serial.println(esid);
  Serial.println("Reading EEPROM pass");

  for (int i = 32; i < 96; ++i)
  {
    epass += char(EEPROM.read(i));
  }
  Serial.print("PASS: ");
  Serial.println(epass);


  WiFi.begin(esid.c_str(), epass.c_str());
  xTaskCreatePinnedToCore(
    buttonSetter, /* Function to implement the task */
    "Buttonset", /* Name of the task */
    10000,  /* Stack size in words */
    NULL,  /* Task input parameter */
    1,  /* Priority of the task */
    &buttonSet,  /* Task handle. */
    0); /* Core where the task should run */
  strip.begin();
  strip.setBrightness(20);
  strip.show(); // Initialize all pixels to 'off'
  client.setServer(mqtt_server, 1883);//connecting to mqtt server
  client.setCallback(callback);
  client.connect("Love_Box");
  client.subscribe("inTopic");
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

void callback(char* topic, byte* payload, unsigned int length) {
  simpleHeart();
}
/*
  void onConnectionEstablished()
  {
  Serial.println("IT WORKED");
  // Subscribe to "mytopic/test" and display received message to Serial
  client.subscribe("mytopic/test", [](const String & payload) {
    simpleHeart();
  });

  // Subscribe to "mytopic/wildcardtest/#" and display received message to Serial
  client.subscribe("mytopic/wildcardtest/#", [](const String & topic, const String & payload) {
    Serial.println("(From wildcard) topic: " + topic + ", payload: " + payload);
  });
  }*/


void reconnect() {
  while (!client.connected() && (WiFi.status() == WL_CONNECTED)) {
    Serial.println("Attempting MQTT connection...");
    if (client.connect("ESP32_clientID")) {
      Serial.println("connected");
      // Once connected, publish an announcement...
      client.publish("outTopic", "Nodemcu connected to MQTT");
      // ... and resubscribe
      client.subscribe("inTopic");

    } else {
      Serial.print("failed, rc=");
      Serial.print(client.state());
      Serial.println(" try again in 5 seconds");
      // Wait 5 seconds before retrying
      delay(5000);
    }
  }
}

void loop() {
  if ((WiFi.status() == WL_CONNECTED)) {
    if (!client.connected()) {
      reconnect();
    }
    else{
      client.loop();
      buttonChecks();
    }
  }
  else
  {
  }

  if (testWifi() && (digitalRead(15) != 1))
  {

    return;
  }
  else
  {
    Serial.println("Connection Status Negative / D15 HIGH");
    Serial.println("Turning the HotSpot On");
    launchWeb();
    setupAP();// Setup HotSpot
  }

  Serial.println();
  Serial.println("Waiting.");

  while ((WiFi.status() != WL_CONNECTED))
  {
    Serial.print(".");
    delay(100);
    server.handleClient();
  }
  delay(1000);
}


//----------------------------------------------- Fuctions used for WiFi credentials saving and connecting to it which you do not need to change
bool testWifi(void)
{
  int c = 0;
  //Serial.println("Waiting for Wifi to connect");
  while ( c < 20 ) {
    if (WiFi.status() == WL_CONNECTED)
    {
      return true;
    }
    delay(500);
    Serial.print("*");
    c++;
  }
  Serial.println("");
  Serial.println("Connect timed out, opening AP");
  return false;
}

void launchWeb()
{
  Serial.println("");
  if (WiFi.status() == WL_CONNECTED)
    Serial.println("WiFi connected");
  Serial.print("Local IP: ");
  Serial.println(WiFi.localIP());
  Serial.print("SoftAP IP: ");
  Serial.println(WiFi.softAPIP());
  createWebServer();
  // Start the server
  server.begin();
  Serial.println("Server started");
}

void setupAP(void)
{
  WiFi.mode(WIFI_STA);
  WiFi.disconnect();
  delay(100);
  int n = WiFi.scanNetworks();
  Serial.println("scan done");
  if (n == 0)
    Serial.println("no networks found");
  else
  {
    Serial.print(n);
    Serial.println(" networks found");
    for (int i = 0; i < n; ++i)
    {
      // Print SSID and RSSI for each network found
      Serial.print(i + 1);
      Serial.print(": ");
      Serial.print(WiFi.SSID(i));
      Serial.print(" (");
      Serial.print(WiFi.RSSI(i));
      Serial.print(")");
      //Serial.println((WiFi.encryptionType(i) == ENC_TYPE_NONE) ? " " : "*");
      delay(10);
    }
  }
  Serial.println("");
  st = "<ol>";
  for (int i = 0; i < n; ++i)
  {
    // Print SSID and RSSI for each network found
    st += "<li>";
    st += WiFi.SSID(i);
    st += " (";
    st += WiFi.RSSI(i);

    st += ")";
    //st += (WiFi.encryptionType(i) == ENC_TYPE_NONE) ? " " : "*";
    st += "</li>";
  }
  st += "</ol>";
  delay(100);
  WiFi.softAP("Love Boxes", "12345678");
  Serial.println("Initializing_softap_for_wifi credentials_modification");
  launchWeb();
  Serial.println("over");
}

void createWebServer()
{
  {
    server.on("/", []() {

      IPAddress ip = WiFi.softAPIP();
      String ipStr = String(ip[0]) + '.' + String(ip[1]) + '.' + String(ip[2]) + '.' + String(ip[3]);
      content = "<!DOCTYPE HTML>\r\n<html>Welcome to Wifi Credentials Update page";
      content += "<form action=\"/scan\" method=\"POST\"><input type=\"submit\" value=\"scan\"></form>";
      content += ipStr;
      content += "<p>";
      content += st;
      content += "</p><form method='get' action='setting'><label>SSID: </label><input name='ssid' length=32><input name='pass' length=64><input type='submit'></form>";
      content += "</html>";
      server.send(200, "text/html", content);
    });
    server.on("/scan", []() {
      //setupAP();
      IPAddress ip = WiFi.softAPIP();
      String ipStr = String(ip[0]) + '.' + String(ip[1]) + '.' + String(ip[2]) + '.' + String(ip[3]);

      content = "<!DOCTYPE HTML>\r\n<html>go back";
      server.send(200, "text/html", content);
    });

    server.on("/setting", []() {
      String qsid = server.arg("ssid");
      String qpass = server.arg("pass");
      if (qsid.length() > 0 && qpass.length() > 0) {
        Serial.println("clearing eeprom");
        for (int i = 0; i < 96; ++i) {
          EEPROM.write(i, 0);
        }
        Serial.println(qsid);
        Serial.println("");
        Serial.println(qpass);
        Serial.println("");

        Serial.println("writing eeprom ssid:");
        for (int i = 0; i < qsid.length(); ++i)
        {
          EEPROM.write(i, qsid[i]);
          Serial.print("Wrote: ");
          Serial.println(qsid[i]);
        }
        Serial.println("writing eeprom pass:");
        for (int i = 0; i < qpass.length(); ++i)
        {
          EEPROM.write(32 + i, qpass[i]);
          Serial.print("Wrote: ");
          Serial.println(qpass[i]);
        }
        EEPROM.commit();

        content = "{\"Success\":\"saved to eeprom... reset to boot into new wifi\"}";
        statusCode = 200;
        ESP.restart();
      } else {
        content = "{\"Error\":\"404 not found\"}";
        statusCode = 404;
        Serial.println("Sending 404");
      }
      server.sendHeader("Access-Control-Allow-Origin", "*");
      server.send(statusCode, "application/json", content);

    });
  }
}
