#include <WiFi.h>
#include <HTTPClient.h>
#include <WebServer.h>
#include <EEPROM.h>
#include <SPIFFS.h>

#include <Adafruit_NeoPixel.h>
#include <EEPROM.h>
#include <PubSubClient.h>

Adafruit_NeoPixel strip = Adafruit_NeoPixel(64, 16, NEO_GRB + NEO_KHZ800);

TaskHandle_t buttonSet;

int list_simpleHeart[] = {0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0};

int list_wifi3[] = {1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 1};
int list_wifi1[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0};
int list_wifi2[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0};

int list_checkmark[] = {0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0};
int list_x[] = {1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1};

int list_letter1[64] = {0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
int list_letter2[64] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0};
int list_plus[64] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
int list_letter1F[64] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
int list_letter2F[64] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
int list_b[64] = {0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0};

int currentTime = millis();
const int timeDifference = 1 * 1000;
int lastTime = millis() - timeDifference;

String ID = "";
String MQTTID = "";
String WIFIssid = "";

int button1Pin = 32;
int button1Value = 0;

int button2Pin = 33;
int button2Value = 0;

int button3Pin = 25;
int button3Value = 0;

int wifiResetPin = 26;

String inTopic = "";
String outTopic = "";

char letter1;
char letter2;

//Variables
int i = 0;
int statusCode;
const char *ssid = "Default SSID";
const char *passphrase = "Default passord";
String st;
String names;
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

const char *mqtt_server = "173.230.138.220";

bool isChar(char c)
{
  return ((c >= 'a' && c <= 'z')
          || (c >= 'A' && c <= 'Z'));
}

// Function to check the character
// is an digit or not
bool isDigit(const char c)
{
  return (c >= '0' && c <= '9');
}

// Function to check email id is
// valid or not
bool is_valid(String email)
{
  // Check the first character
  // is an alphabet or not
  if (!isChar(email[0])) {

    // If it's not an alphabet
    // email id is not valid
    return 0;
  }
  // Variable to store position
  // of At and Dot
  int At = -1, Dot = -1;

  // Traverse over the email id
  // string to find position of
  // Dot and At
  for (int i = 0;
       i < email.length(); i++) {

    // If the character is '@'
    if (email[i] == '@') {

      At = i;
    }

    // If character is '.'
    else if (email[i] == '.') {

      Dot = i;
    }
  }

  // If At or Dot is not present
  if (At == -1 || Dot == -1)
    return 0;

  // If Dot is present before At
  if (At > Dot)
    return 0;

  // If Dot is present at the end
  return !(Dot >= (email.length() - 1));
}


void setLetter(int a[], int b[]) {
  for (int i = 0; i < 64; i++) {
    a[i] = b[i];
  }
}

void setLetters(char a, char b) {
  if (isUpperCase(a)) {
    a = a + 32;
  }
  if (isUpperCase(b)) {
    b = b + 32;
  }
  if (a == 'a') {
    int a_letter1[64] = {0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    setLetter(list_letter1, a_letter1);
  }
  else if (a == 'b') {
    int b_letter1[64] = {0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    setLetter(list_letter1, b_letter1);
  }
  else if (a == 'c') {
    int c_letter1[64] = {0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    setLetter(list_letter1, c_letter1);
  }
  else if (a == 'd') {
    int d_letter1[64] = {0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    setLetter(list_letter1, d_letter1);
  }
  else if (a == 'e') {
    int e_letter1[64] = {0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    setLetter(list_letter1, e_letter1);
  }
  else if (a == 'f') {
    int f_letter1[64] = {0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    setLetter(list_letter1, f_letter1);
  }
  else if (a == 'g') {
    int g_letter1[64] = {0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    setLetter(list_letter1, g_letter1);
  }
  else if (a == 'h') {
    int h_letter1[64] = {0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    setLetter(list_letter1, h_letter1);
  }
  else if (a == 'i') {
    int i_letter1[64] = {0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    setLetter(list_letter1, i_letter1);
  }
  else if (a == 'j') {
    int j_letter1[64] = {0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    setLetter(list_letter1, j_letter1);
  }
  else if (a == 'k') {
    int k_letter1[64] = {0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    setLetter(list_letter1, k_letter1);
  }
  else if (a == 'l') {
    int l_letter1[64] = {0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    setLetter(list_letter1, l_letter1);
  }
  else if (a == 'm') {
    int m_letter1[64] = {0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    setLetter(list_letter1, m_letter1);
  }
  else if (a == 'n') {
    int n_letter1[64] = {0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    setLetter(list_letter1, n_letter1);
  }
  else if (a == 'o') {
    int o_letter1[64] = {0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    setLetter(list_letter1, o_letter1);
  }
  else if (a == 'p') {
    int p_letter1[64] = {0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    setLetter(list_letter1, p_letter1);
  }
  else if (a == 'q') {
    int q_letter1[64] = {0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    setLetter(list_letter1, q_letter1);
  }
  else if (a == 'r') {
    int r_letter1[64] = {0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    setLetter(list_letter1, r_letter1);
  }
  else if (a == 's') {
    int s_letter1[64] = {0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    setLetter(list_letter1, s_letter1);
  }
  else if (a == 't') {
    int t_letter1[64] = {0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    setLetter(list_letter1, t_letter1);
  }
  else if (a == 'u') {
    int u_letter1[64] = {0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    setLetter(list_letter1, u_letter1);
  }
  else if (a == 'v') {
    int v_letter1[64] = {0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    setLetter(list_letter1, v_letter1);
  }
  else if (a == 'w') {
    int w_letter1[64] = {0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    setLetter(list_letter1, w_letter1);
  }
  else if (a == 'x') {
    int x_letter1[64] = {0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    setLetter(list_letter1, x_letter1);
  }
  else if (a == 'y') {
    int y_letter1[64] = {0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    setLetter(list_letter1, y_letter1);
  }
  else if (a == 'z') {
    int z_letter1[64] = {0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    setLetter(list_letter1, z_letter1);
  }
  if (b == 'a') {
    int a_letter2[64] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0};
    setLetter(list_letter2, a_letter2);
  }
  else if (b == 'b') {
    int b_letter2[64] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0};
    setLetter(list_letter2, b_letter2);
  }
  else if (b == 'c') {
    int c_letter2[64] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0};
    setLetter(list_letter2, c_letter2);
  }
  else if (b == 'd') {
    int d_letter2[64] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0};
    setLetter(list_letter2, d_letter2);
  }
  else if (b == 'e') {
    int e_letter2[64] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0};
    setLetter(list_letter2, e_letter2);
  }
  else if (b == 'f') {
    int f_letter2[64] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0};
    setLetter(list_letter2, f_letter2);
  }
  else if (b == 'g') {
    int g_letter2[64] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 1, 1, 0, 1, 0, 0, 0};
    setLetter(list_letter2, g_letter2);
  }
  else if (b == 'h') {
    int h_letter2[64] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0};
    setLetter(list_letter2, h_letter2);
  }
  else if (b == 'i') {
    int i_letter2[64] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0};
    setLetter(list_letter2, i_letter2);
  }
  else if (b == 'j') {
    int j_letter2[64] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0};
    setLetter(list_letter2, j_letter2);
  }
  else if (b == 'k') {
    int k_letter2[64] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0};
    setLetter(list_letter2, k_letter2);
  }
  else if (b == 'l') {
    int l_letter2[64] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0};
    setLetter(list_letter2, l_letter2);
  }
  else if (b == 'm') {
    int m_letter2[64] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0};
    setLetter(list_letter2, m_letter2);
  }
  else if (b == 'n') {
    int n_letter2[64] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0};
    setLetter(list_letter2, n_letter2);
  }
  else if (b == 'o') {
    int o_letter2[64] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0};
    setLetter(list_letter2, o_letter2);
  }
  else if (b == 'p') {
    int p_letter2[64] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0};
    setLetter(list_letter2, p_letter2);
  }
  else if (b == 'q') {
    int q_letter2[64] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1, 0, 0, 0, 0};
    setLetter(list_letter2, q_letter2);
  }
  else if (b == 'r') {
    int r_letter2[64] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0};
    setLetter(list_letter2, r_letter2);
  }
  else if (b == 's') {
    int s_letter2[64] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0};
    setLetter(list_letter2, s_letter2);
  }
  else if (b == 't') {
    int t_letter2[64] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0};
    setLetter(list_letter2, t_letter2);
  }
  else if (b == 'u') {
    int u_letter2[64] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0};
    setLetter(list_letter2, u_letter2);
  }
  else if (b == 'v') {
    int v_letter2[64] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0};
    setLetter(list_letter2, v_letter2);
  }
  else if (b == 'w') {
    int w_letter2[64] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0};
    setLetter(list_letter2, w_letter2);
  }
  else if (b == 'x') {
    int x_letter2[64] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0};
    setLetter(list_letter2, x_letter2);
  }
  else if (b == 'y') {
    int y_letter2[64] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0};
    setLetter(list_letter2, y_letter2);
  }
  else if (b == 'z') {
    int z_letter2[64] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0};
    setLetter(list_letter2, z_letter2);
  }
}

int button1Check()
{
  if (digitalRead(button1Pin) == 1)
  {
    button1Value = 1;
    return (1);
  }
  return (0);
}

int button2Check()
{
  if (digitalRead(button2Pin) == 1)
  {
    button2Value = 1;
    return (1);
  }
  return (0);
}

int button3Check()
{
  if (digitalRead(button3Pin) == 1)
  {
    button3Value = 1;
    return (1);
  }
  return (0);
}

void buttonSetter(void *parameter)
{
  while (1)
  {
    if (millis() - lastTime > timeDifference)
    {

      if (button1Check() || button2Check() || button3Check())
      {
        Serial.println("TOUCH DETTECTED");
        lastTime = millis();
      }
    }
    delay(1);
  }
}

void buttonChecks()
{
  if (button1Value)
  {
    button1Value = 0;
    client.publish(outTopic.c_str(), "button1");
  }
  else if (button2Value)
  {
    button2Value = 0;
    client.publish(outTopic.c_str(), "button2");
  }
  else if (button3Value)
  {
    button3Value = 0;
    client.publish(outTopic.c_str(), "button3");
  }
}

String uint64ToString(uint64_t input)
{
  String result = "";
  uint8_t base = 10;

  do
  {
    char c = input % base;
    input /= base;

    if (c < 10)
      c += '0';
    else
      c += 'A' - 10;
    result = c + result;
  } while (input);
  return result;
}

void setup()
{

  Serial.begin(115200); //Initialising if(DEBUG)Serial Monitor
  ID = uint64ToString(ESP.getEfuseMac());
  WIFIssid = ("Love Link #" + ID);
  MQTTID = ("LoveLink-" + ID);
  pinMode(button1Pin, INPUT_PULLDOWN);
  pinMode(button2Pin, INPUT_PULLDOWN);
  pinMode(button3Pin, INPUT_PULLDOWN);
  pinMode(wifiResetPin, INPUT_PULLDOWN);
  Serial.println();
  Serial.println("Disconnecting current wifi connection");
  WiFi.disconnect();
  WiFi.setHostname(WIFIssid.c_str());
  EEPROM.begin(1024); //Initialasing EEPROM
  delay(10);
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
  Serial.println("Reading EEPROM inTopic");
  for (int i = 96; i < 416; i++)
  {
    inTopic += char(EEPROM.read(i));
  }
  Serial.print("inTopic: ");
  Serial.println(inTopic);
  Serial.println("Reading EEPROM outTopic");
  for (int i = 416; i < 736; i++)
  {
    outTopic += char(EEPROM.read(i));
  }
  Serial.print("outTopic: ");
  Serial.println(outTopic);
  Serial.println("Reading EEPROM letter1");
  for (int i = 736; i < 737; i++)
  {
    letter1 = char(EEPROM.read(i));
  }
  Serial.print("letter1: ");
  Serial.println(letter1);
  Serial.println("Reading EEPROM letter2");
  for (int i = 737; i < 738; i++)
  {
    letter2 = char(EEPROM.read(i));
  }
  Serial.print("letter2: ");
  Serial.println(letter2);
  setLetters(letter1, letter2);
  WiFi.begin(esid.c_str(), epass.c_str());
  xTaskCreatePinnedToCore(
    buttonSetter, /* Function to implement the task */
    "Buttonset",  /* Name of the task */
    10000,        /* Stack size in words */
    NULL,         /* Task input parameter */
    1,            /* Priority of the task */
    &buttonSet,   /* Task handle. */
    0);           /* Core where the task should run */
  strip.begin();
  strip.setBrightness(20);
  strip.show();                        // Initialize all pixels to 'off'
  client.setServer(mqtt_server, 1883); //connecting to mqtt server
  client.setCallback(callback);
  client.connect(MQTTID.c_str());
  client.subscribe(inTopic.c_str());
}

void letterTransition()
{
  setLetters();
  int vib = 0;
  int counter = 0;
  int flag1 = 0;
  int flag2 = 0;
  for (int j = 0; j < 8; j++)
  {
    for (int i = 0; i < strip.numPixels(); i++)
    {
      if (list_letter1[i] || list_plus[i] || list_letter2[i])
      {
        if (int(i / 8) - 7 + j >= 0)
        {
          if (list_letter1[i])
          {
            strip.setPixelColor(i - (8 * (7 - j)), strip.Color(255, 0, 0));
          }
          else if (list_letter2[i])
          {
            strip.setPixelColor(i - (8 * (7 - j)), strip.Color(0, 0, 255));
          }
          if (list_plus[i])
          {
            strip.setPixelColor(i - (8 * (7 - j)), strip.Color(0, 255, 0));
          }
        }
      }
    }
    strip.show();
    for (int k = 0; k < 200; k++)
    {
      delay(1);
      counter += 0.001;
      buttonChecks();
    }
    if (counter > 0.08 && vib)
    {
      vib = 0;
      //vibmotoroff
    }
    if (counter >= 0.5)
    {
      //vibmotoron
      vib = 1;
      counter = 0;
    }
    for (int i = 0; i < strip.numPixels(); i++)
    {
      strip.setPixelColor(i, strip.Color(0, 0, 0));
    }
  }
  for (int j = 0; j < 4; j++)
  {
    for (int i = 0; i < strip.numPixels(); i++)
    {
      if (list_letter1[i])
      {
        strip.setPixelColor(i - j, strip.Color(255, 0, 0));
        if (j == 3)
        {
          list_letter1F[i - j] = 1;
        }
      }

      if (list_letter2[i])
      {
        strip.setPixelColor(i + j, strip.Color(0, 0, 255));
        if (j == 3)
        {
          list_letter2F[i + j] = 1;
        }
      }
    }
    strip.setPixelColor(28, strip.Color(0, 255, 0));
    strip.setPixelColor(37, strip.Color(0, 255, 0));
    strip.setPixelColor(36, strip.Color(0, 255, 0));
    strip.setPixelColor(35, strip.Color(0, 255, 0));
    strip.setPixelColor(44, strip.Color(0, 255, 0));
    strip.show();

    for (int k = 0; k < 200; k++)
    {
      delay(1);
      counter += 0.001;
      buttonChecks();
    }
    if (counter > 0.08 && vib)
    {
      vib = 0;
      //vibmotoroff
    }
    if (counter >= 0.5)
    {
      //vibmotoron
      vib = 1;
      counter = 0;
    }
    for (int i = 0; i < strip.numPixels(); i++)
    {
      strip.setPixelColor(i, strip.Color(0, 0, 0));
    }
  }
  for (int j = 0; j < 255; j++)
  {
    for (int i = 0; i < strip.numPixels(); i++)
    {
      if (list_letter1F[i])
      {
        strip.setPixelColor(i, strip.Color(255 - j, 0, 0));
      }
      if (list_letter2F[i])
      {
        strip.setPixelColor(i, strip.Color(0, 0, 255 - j));
      }
    }
    strip.setPixelColor(28, strip.Color(0, 255 - j, 0));
    strip.setPixelColor(37, strip.Color(0, 255 - j, 0));
    strip.setPixelColor(36, strip.Color(0, 255 - j, 0));
    strip.setPixelColor(35, strip.Color(0, 255 - j, 0));
    strip.setPixelColor(44, strip.Color(0, 255 - j, 0));
    for (int k = 0; k < 10; k++)
    {
      delay(1);
      counter += 0.02;
      buttonChecks();
    }
    if (counter > 0.08 && vib)
    {
      vib = 0;
      //vibmotoroff
    }
    if (counter >= 0.5)
    {
      //vibmotoron
      vib = 1;
      counter = 0;
    }
    strip.show();
  }
}

void setLetters()
{
  //write switch case statement for all the 26 letters
}

void complicatedHeart()
{
  //vibmotoron
  int counter = 0;
  for (int j = 0; j < 256; j++)
  {
    for (int i = 0; i < strip.numPixels(); i++)
    {
      strip.setPixelColor(i, strip.Color(j, j, j));
    }
    for (int k = 0; k < 5; k++)
    {
      delay(1);
      buttonChecks();
    }
    counter++;
    ;
    if (counter > 200)
    {
      //vibmotoroff
    }
    strip.show();
  }
  for (int i = 0; i < strip.numPixels(); i++)
  {
    if (list_b[i])
    {
      strip.setPixelColor(i, strip.Color(0, 0, 0));
      strip.show();
      for (int k = 0; k < 100; k++)
      {
        delay(1);
        buttonChecks();
      }
    }
  }
  for (int i = 0; i < strip.numPixels(); i++)
  {
    if (!list_b[i] && list_simpleHeart[i])
    {
      strip.setPixelColor(i, strip.Color(255, 0, 0));
      strip.show();

      for (int k = 0; k < 100; k++)
      {
        delay(1);
        buttonChecks();
      }
    }
  }
  for (int k = 0; k < 200; k++)
  {
    delay(1);
    buttonChecks();
  }
  for (int j = 0; j < 5; j++)
  {
    //vibmotorstuff YOU NEED TO DO TOALSKDASJKD:LASJDAL:SDJAL:SDJK:ALSKJD:LASKDJ:LASKJD:LAKSJDDDDDDDDDDDDDDDDDDDDDDDD
    for (int i = 0; i < strip.numPixels(); i++)
    {
      if (list_b[i])
      {
        strip.setPixelColor(i, strip.Color(255, 0, 0));
        strip.show();
      }
    }
    for (int k = 0; k < 800; k++)
    {
      delay(1);
      buttonChecks();
    }
    for (int i = 0; i < strip.numPixels(); i++)
    {
      if (list_b[i])
      {
        strip.setPixelColor(i, strip.Color(0, 0, 0));
        strip.show();
      }
    }
    for (int k = 0; k < 800; k++)
    {
      delay(1);
      buttonChecks();
    }
  }
  for (int i = 0; i < strip.numPixels(); i++)
  {
    if (list_b[i])
    {
      strip.setPixelColor(i, strip.Color(255, 0, 0));
      strip.show();
    }
  }
  for (int j = 0; j < 255; j++)
  {
    for (int i = 0; i < strip.numPixels(); i++)
    {
      if (list_simpleHeart[i])
      {
        strip.setPixelColor(i, strip.Color(255 - j, 0, 0));
      }
      else
      {
        strip.setPixelColor(i, strip.Color(255 - j, 255 - j, 255 - j));
      }
    }
    strip.show();
    for (int k = 0; k < 5; k++)
    {
      delay(1);
      buttonChecks();
    }
  }
}

void simpleHeart()
{
  int counter = 0;
  for (int f = 0; f < 2; f++)
  {
    for (int j = 0; j < 256; j++)
    {
      for (int i = 0; i < strip.numPixels(); i++)
      {
        buttonChecks();
        if (list_simpleHeart[i])
        {
          if (j < 256 / 2 && f == 0)
          {
            strip.setPixelColor(i, strip.Color(255, j, int(256 / 2)));
          }
          else if (j > 256 / 2 && f == 0)
          {
            strip.setPixelColor(i, strip.Color(255, int(256 / 2), j));
          }
          else if (j < 256 / 2 && f == 1)
          {
            strip.setPixelColor(i, strip.Color(255, int(256 / 2), 255 - j));
          }
          else if (j > 256 / 2 && f == 1)
          {
            strip.setPixelColor(i, strip.Color(255, 256 - j, int(256 / 2)));
          }
        }
      }
      strip.show();
      delay(10);
      counter += 0.01;
    }
  }
  for (int j = 0; j < 255; j++)
  {
    for (int i = 0; i < strip.numPixels(); i++)
    {
      buttonChecks();
      if (list_simpleHeart[i])
      {
        strip.setPixelColor(i, strip.Color(255 - j, 0, int(256 / 2 - j / 2)));
      }
    }
    strip.show();
    delay(10);
  }
}

void wifi3()
{
  for (int i = 0; i < strip.numPixels(); i++)
  {
    if (list_wifi3[i])
    {
      strip.setPixelColor(i, strip.Color(0, 0, 255));
    }
    else
    {
      strip.setPixelColor(i, strip.Color(0, 0, 0));
    }
  }
  strip.show();
}
void wifi1()
{
  for (int i = 0; i < strip.numPixels(); i++)
  {
    if (list_wifi1[i])
    {
      strip.setPixelColor(i, strip.Color(0, 0, 255));
    }
    else
    {
      strip.setPixelColor(i, strip.Color(0, 0, 0));
    }
  }
  strip.show();
}
void wifi2()
{
  for (int i = 0; i < strip.numPixels(); i++)
  {
    if (list_wifi2[i])
    {
      strip.setPixelColor(i, strip.Color(0, 0, 255));
    }
    else
    {
      strip.setPixelColor(i, strip.Color(0, 0, 0));
    }
  }
  strip.show();
}
void checkmark()
{
  for (int i = 0; i < strip.numPixels(); i++)
  {
    if (list_checkmark[i])
    {
      strip.setPixelColor(i, strip.Color(0, 255, 0));
    }
    else
    {
      strip.setPixelColor(i, strip.Color(0, 0, 0));
    }
  }
  strip.show();
}

void x()
{
  for (int i = 0; i < strip.numPixels(); i++)
  {
    if (list_x[i])
    {
      strip.setPixelColor(i, strip.Color(255, 0, 0));
    }
    else
    {
      strip.setPixelColor(i, strip.Color(0, 0, 0));
    }
  }
  strip.show();
}

void clearStrip()
{
  for (int i = 0; i < strip.numPixels(); i++)
  {
    strip.setPixelColor(i, strip.Color(0, 0, 0));
  }
  strip.show();
}

void callback(char *topic, byte *payload, unsigned int length)
{
  String message = "";
  Serial.print("Message arrived [");
  Serial.print(topic);
  Serial.print("] ");
  for (int i = 0; i < length; i++)
  {
    Serial.print((char)payload[i]);
    message += (char)payload[i];
  }
  Serial.println();
  if (message == "button1")
  {
    simpleHeart();
  }
  if (message == "button2")
  {
    letterTransition();
  }
  if (message == "button3")
  {
    complicatedHeart();
  }
}

void reconnect()
{
  while (!client.connected() && (WiFi.status() == WL_CONNECTED))
  {
    Serial.println("Attempting MQTT connection...");
    if (client.connect(MQTTID.c_str()))
    {
      Serial.println("connected");
      // Once connected, publish an announcement...
      // ... and resubscribe
      client.subscribe(inTopic.c_str());
    }
    else
    {
      Serial.print("failed, rc=");
      Serial.print(client.state());
      Serial.println(" try again in 5 seconds");
      // Wait 5 seconds before retrying
      delay(5000);
    }
  }
}

void loop()
{
  if ((WiFi.status() == WL_CONNECTED))
  {
    if (!client.connected())
    {
      reconnect();
    }
    else
    {
      client.loop();
      buttonChecks();
    }
  }
  else
  {
  }

  if (testWifi() && (digitalRead(wifiResetPin) != 1))
  {

    return;
  }
  else
  {
    Serial.println("Connection Status Negative / D15 HIGH");
    Serial.println("Turning the HotSpot On");
    wifi1();
    launchWeb();
    setupAP(); // Setup HotSpot
  }

  Serial.println();
  Serial.println("Waiting.");

  while ((WiFi.status() != WL_CONNECTED))
  {
    if (digitalRead(wifiResetPin))
    {
      x();
      delay(500);
      ESP.restart();
    }
    //Serial.print(".");
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
  while (c < 20)
  {
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
  names = "";
  Serial.println("scan done");
  wifi2();
  delay(300);
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
      names += WiFi.SSID(i);
      names += ";";
      Serial.print(" (");
      Serial.print(WiFi.RSSI(i));
      Serial.print(")");
      //Serial.println((WiFi.encryptionType(i) == ENC_TYPE_NONE) ? " " : "*");
      delay(10);
    }
  }
  Serial.println("");
  Serial.println(names);
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
  WiFi.softAP(WIFIssid.c_str(), "");
  Serial.println("Initializing_softap_for_wifi credentials_modification");
  launchWeb();
  wifi3();
  Serial.println("over");
}

void clearEE(int a, int b) {
  for (int i = a; i < b; ++i)
  {
    EEPROM.write(i, 0);
  }
}

void createWebServer()
{
  {
    server.on("/", []()
    {
      IPAddress ip = WiFi.softAPIP();
      String ipStr = String(ip[0]) + '.' + String(ip[1]) + '.' + String(ip[2]) + '.' + String(ip[3]);
      /*
        content = "<!DOCTYPE HTML>\r\n<html>Welcome to Wifi Credentials Update page";
        content += "<form action=\"/scan\" method=\"POST\"><input type=\"submit\" value=\"scan\"></form>";
        content += "<p>";
        content += st;
        content += "</p><form method='get' action='setting'><label>SSID: </label><input name='ssid' length=32><br><label>Password: </label><input name='pass' length=64><br><label>Your Email: </label><input name='inTopic' length=320><br><label>Recievers Email: </label><input name='outTopic' length=320><br><label>Your First Name Initial: </label><input name='letter1' length=1><br><label>Reciever's First Name Initial: </label><input name='letter2' length=1><br><input type='submit'><br></form>";
        content += "</html>";
      */
      content = "<!DOCTYPE html>";
      content += "<html lang=\"en\">";
      content += "<head>";
      content += "<meta charset=\"UTF-8\" />";
      content += "<title>Love Link Setup</title>";
      content += "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\" />";
      content += "<style>";
      content += "@import url(\"https://fonts.googleapis.com/css?family=Roboto\");";
      content += "";
      content += "* {";
      content += "margin: 0;";
      content += "padding: 0;";
      content += "box-sizing: border-box;";
      content += "outline: none;";
      content += "font-family: \"Roboto\", sans-serif;";
      content += "}";
      content += "";
      content += "body {";
      content += "background: url(\"bg.jpg\") no-repeat top center;";
      content += "background-size: cover;";
      content += "height: 100vh;";
      content += "}";
      content += "";
      content += ".wrapper {";
      content += "position: absolute;";
      content += "top: 50%;";
      content += "left: 50%;";
      content += "transform: translate(-50%, -50%);";
      content += "width: 100%;";
      content += "max-width: 550px;";
      content += "background: rgba(0, 0, 0, 0.8);";
      content += "padding: 30px;";
      content += "border-radius: 5px;";
      content += "box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);";
      content += "}";
      content += "";
      content += ".wrapper .title h1 {";
      content += "color: #c5ecfd;";
      content += "text-align: center;";
      content += "margin-bottom: 25px;";
      content += "}";
      content += "";
      content += ".contact-form {";
      content += "display: flex;";
      content += "}";
      content += "";
      content += ".input-fields {";
      content += "display: flex;";
      content += "flex-direction: column;";
      content += "margin-right: 4%;";
      content += "}";
      content += "";
      content += ".input-fields,";
      content += ".msg {";
      content += "width: 100%;";
      content += "}";
      content += "";
      content += ".input-fields .input,";
      content += ".msg textarea {";
      content += "margin: 10px 0;";
      content += "background: transparent;";
      content += "border: 0px;";
      content += "border-bottom: 2px solid #c5ecfd;";
      content += "padding: 10px;";
      content += "color: #c5ecfd;";
      content += "width: 100%;";
      content += "}";
      content += "";
      content += ".msg textarea {";
      content += "height: 212px;";
      content += "}";
      content += "";
      content += "::-webkit-input-placeholder {";
      content += "/* Chrome/Opera/Safari */";
      content += "color: #c5ecfd;";
      content += "}";
      content += "::-moz-placeholder {";
      content += "/* Firefox 19+ */";
      content += "color: #c5ecfd;";
      content += "}";
      content += ":-ms-input-placeholder {";
      content += "/* IE 10+ */";
      content += "color: #c5ecfd;";
      content += "}";
      content += "";
      content += ".btn {";
      content += "background: #39b7dd;";
      content += "text-align: center;";
      content += "padding: 15px;";
      content += "border-radius: 5px;";
      content += "color: #fff;";
      content += "cursor: pointer;";
      content += "text-transform: uppercase;";
      content += "}";
      content += "";
      content += "@media screen and (max-width: 600px) {";
      content += ".contact-form {";
      content += "flex-direction: column;";
      content += "}";
      content += ".msg textarea {";
      content += "height: 80px;";
      content += "}";
      content += ".input-fields,";
      content += ".msg {";
      content += "width: 100%;";
      content += "}";
      content += "}";
      content += "";
      content += "select > option {background: #333333;}";
      content += "</style>";
      content += "</head>";
      content += "<body>";
      content += "<div class=\"wrapper\">";
      content += "<div class=\"title\">";
      content += "<h1>Setup Love Link</h1>";
      content += "</div>";
      content += "<form method='get' action='setting'>";
      content += "<div class=\"contact-form\">";
      content += "<div class=\"input-fields\">";
      content += "<select name=\"ssid\" class=\"input\">";
      content += "<option value=\"\">SSID</option>";
      int index1 = 0;
      int index2 = names.indexOf(';');
      String temp = "";
      while (index2 > 0)
      {
        temp = "<option value=\"";
        temp += names.substring(index1, index2);
        temp += "\">";
        temp += names.substring(index1, index2);
        temp += "</option>";
        content += temp;
        index1 = index2 + 1;
        index2 = names.indexOf(';', index1);
      }
      content += "</select>";
      content += "";
      content += "<input";
      content += " type=\"text\"";
      content += " class=\"input\"";
      content += " name=\"pass\"";
      content += " length=\"64\"";
      content += " placeholder=\"Password\"";
      content += "/>";
      content += "<input";
      content += " type=\"text\"";
      content += " class=\"input\"";
      content += " name=\"inTopic\"";
      content += " length=\"320\"";
      content += " placeholder=\"Sender's Email\"";
      content += "/>";
      content += "<input";
      content += " type=\"text\"";
      content += " class=\"input\"";
      content += " name=\"outTopic\"";
      content += " length=\"320\"";
      content += " placeholder=\"Reciever's Email\"";
      content += "/>";
      content += "<input";
      content += " type=\"text\"";
      content += " class=\"input\"";
      content += " name=\"letter1\"";
      content += " length=\"1\"";
      content += " placeholder=\"Sender's First Name\"";
      content += "/>";
      content += "<input";
      content += " type=\"text\"";
      content += " class=\"input\"";
      content += " name=\"letter2\"";
      content += " length=\"1\"";
      content += " placeholder=\"Reciever's First Name\"";
      content += "/>";
      content += "<input type = \"submit\" class=\"btn\" value=\"Submit\"/>";
      content += "</div>";
      content += "</div>";
      content += "</form>";
      content += "</div>";
      content += "</body>";
      content += "</html>";

      server.send(200, "text/html", content);
    });
    server.on("/scan", []()
    {
      //setupAP();
      IPAddress ip = WiFi.softAPIP();
      String ipStr = String(ip[0]) + '.' + String(ip[1]) + '.' + String(ip[2]) + '.' + String(ip[3]);

      content = "<!DOCTYPE HTML>\r\n<html>go back";
      server.send(200, "text/html", content);
    });
    /*(
      server.on("/favicon.ico", HTTP_GET, [](){
      request->send(SPIFFS, "/favicon.png", "image/png");
      });
    */
    server.on("/setting", []()
    {
      String qsid = server.arg("ssid");
      String qpass = server.arg("pass");
      String qin = server.arg("inTopic");
      String qout = server.arg("outTopic");
      String qletter1 = server.arg("letter1");
      String qletter2 = server.arg("letter2");
      String tempContent = "";
      int flag = 0;
      int flag2 = 0;
      Serial.println(qsid);
      Serial.println("-");
      Serial.println(qpass);
      Serial.println("-");
      Serial.println(qin);
      Serial.println("-");
      Serial.println(qout);
      Serial.println("-");
      Serial.println(qletter1);
      Serial.println("-");
      Serial.println(qletter2);
      Serial.println("-");
      if ((qin.length() > 0 && !is_valid(qin)) || (qout.length() > 0 && !is_valid(qout)) || !isAlpha((qletter1[0])) || !isAlpha((qletter2[0]))) {
        flag2 = 1;
      }
      if (qsid.length() > 0) {
        flag = 1;
        if (!flag2) {
          Serial.println("writing eeprom ssid:");
          for (int i = 0; i < qsid.length(); ++i)
          {
            EEPROM.write(i, qsid[i]);
            Serial.print("Wrote: ");
            Serial.println(qsid[i]);
          }
          clearEE(qsid.length(), 32);

          tempContent += "<p class=\"input\">Saved Wifi name as: ";
          tempContent += qsid;
          tempContent += "</p>";
        }
      }
      if (qpass.length() > 0) {
        flag = 1;
        if (!flag2) {
          Serial.println("writing eeprom pass:");
          for (int i = 0; i < qpass.length(); ++i)
          {
            EEPROM.write(32 + i, qpass[i]);
            Serial.print("Wrote: ");
            Serial.println(qpass[i]);
          }
          clearEE(32 + qpass.length(), 96);
          tempContent += "<p class=\"input\">Saved Wifi Password as: ";
          tempContent += qpass;
          tempContent += "</p>";
        }
      }
      if (qin.length() > 0) {
        flag = 1;
        if (is_valid(qin)) {
          if (!flag2) {
            Serial.println("writing eeprom inTopic:");
            for (int i = 0; i < qin.length(); ++i)
            {
              EEPROM.write(96 + i, qin[i]);
              Serial.print("Wrote: ");
              Serial.println(qin[i]);
            }
            clearEE(96 + qin.length(), 416);
            tempContent += "<p class=\"input\">Saved your email as: ";
            tempContent += qin;
            tempContent += "</p>";
          }
        }
        else {
          flag2 = 1;
          tempContent += "<p class=\"input\">Your email was invalid, you entered: ";
          tempContent += qin;
          tempContent += "</p>";
        }
      }
      if (qout.length() > 0) {
        flag = 1;
        if (is_valid(qout)) {
          if (!flag2) {
            Serial.println("writing eeprom outTopic:");
            for (int i = 0; i < qout.length(); ++i)
            {
              EEPROM.write(416 + i, qout[i]);
              Serial.print("Wrote: ");
              Serial.println(qout[i]);
            }
            clearEE(416 + qsid.length(), 736);
            tempContent += "<p class=\"input\">Saved reciever's email as: ";
            tempContent += qout;
            tempContent += "</p>";
          }
        }
        else {
          flag2 = 1;
          tempContent += "<p class=\"input\">Reciever's email was invalid, you entered: ";
          tempContent += qout;
          tempContent += "</p>";
        }
      }
      if (qletter1.length() > 0) {
        flag = 1;
        if (isAlpha((qletter1[0]))) {
          if (!flag2) {
            Serial.println("writing eeprom letter1:");
            EEPROM.write(736, qletter1[0]);
            Serial.print("Wrote: ");
            Serial.println(qletter1[0]);
            tempContent += "<p class=\"input\">Saved your first name as: ";
            tempContent += qletter1;
            tempContent += "</p>";
          }
        }
        else {
          flag2 = 1;
          tempContent += "<p class=\"input\">Your first name was invalid, you entered: ";
          tempContent += qletter1;
          tempContent += "</p>";
        }
      }
      if (qletter2.length() > 0) {
        flag = 1;
        if (isAlpha((qletter2[0]))) {
          if (!flag2) {
            Serial.println("writing eeprom letter2:");
            EEPROM.write(737, qletter2[0]);
            Serial.print("Wrote: ");
            Serial.println(qletter2[0]);
            tempContent += "<p class=\"input\">Saved reciever's first name as: ";
            tempContent += qletter2;
            tempContent += "</p>";
          }
        }
        else {
          flag2 = 1;
          tempContent += "<p class=\"input\">Reciever's first name was invalid, you entered: ";
          tempContent += qletter2;
          tempContent += "</p>";
        }
      }
      content = "<!DOCTYPE html>";
      content += "<html lang=\"en\">";
      content += "<head>";
      content += "<meta charset=\"UTF-8\" />";
      content += "<title>Love Link Setup</title>";
      content += "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\" />";
      content += "<style>";
      content += "@import url(\"https://fonts.googleapis.com/css?family=Roboto\");";
      content += "";
      content += "* {";
      content += "margin: 0;";
      content += "padding: 0;";
      content += "box-sizing: border-box;";
      content += "outline: none;";
      content += "font-family: \"Roboto\", sans-serif;";
      content += "}";
      content += "";
      content += "body {";
      content += "background: url(\"bg.jpg\") no-repeat top center;";
      content += "background-size: cover;";
      content += "height: 100vh;";
      content += "}";
      content += "";
      content += ".wrapper {";
      content += "position: absolute;";
      content += "top: 50%;";
      content += "left: 50%;";
      content += "transform: translate(-50%, -50%);";
      content += "width: 100%;";
      content += "max-width: 550px;";
      content += "background: rgba(0, 0, 0, 0.8);";
      content += "padding: 30px;";
      content += "border-radius: 5px;";
      content += "box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);";
      content += "}";
      content += "";
      content += ".wrapper .title h1 {";
      content += "color: #c5ecfd;";
      content += "text-align: center;";
      content += "margin-bottom: 25px;";
      content += "}";
      content += "";
      content += ".contact-form {";
      content += "display: flex;";
      content += "}";
      content += "";
      content += ".input-fields {";
      content += "display: flex;";
      content += "flex-direction: column;";
      content += "margin-right: 4%;";
      content += "}";
      content += "";
      content += ".input-fields,";
      content += ".msg {";
      content += "width: 100%;";
      content += "}";
      content += "";
      content += ".input-fields .input,";
      content += ".msg textarea {";
      content += "margin: 10px 0;";
      content += "background: transparent;";
      content += "border: 0px;";
      content += "border-bottom: 2px solid #c5ecfd;";
      content += "padding: 10px;";
      content += "color: #c5ecfd;";
      content += "width: 100%;";
      content += "}";
      content += "";
      content += ".msg textarea {";
      content += "height: 212px;";
      content += "}";
      content += "";
      content += "::-webkit-input-placeholder {";
      content += "/* Chrome/Opera/Safari */";
      content += "color: #c5ecfd;";
      content += "}";
      content += "::-moz-placeholder {";
      content += "/* Firefox 19+ */";
      content += "color: #c5ecfd;";
      content += "}";
      content += ":-ms-input-placeholder {";
      content += "/* IE 10+ */";
      content += "color: #c5ecfd;";
      content += "}";
      content += "";
      content += ".btn {";
      content += "background: #39b7dd;";
      content += "text-align: center;";
      content += "padding: 15px;";
      content += "border-radius: 5px;";
      content += "color: #fff;";
      content += "cursor: pointer;";
      content += "text-transform: uppercase;";
      content += "}";
      content += "";
      content += "@media screen and (max-width: 600px) {";
      content += ".contact-form {";
      content += "flex-direction: column;";
      content += "}";
      content += ".msg textarea {";
      content += "height: 80px;";
      content += "}";
      content += ".input-fields,";
      content += ".msg {";
      content += "width: 100%;";
      content += "}";
      content += "}";
      content += "";
      content += "select > option {background: #333333;}";
      content += "</style>";
      content += "</head>";
      content += "<body>";
      content += "<div class=\"wrapper\">";
      content += "<div class=\"title\">";
      content += "<h1>";
      if (!flag || flag2) {
        Serial.print("Flag 1: ");
        Serial.print(flag);
        Serial.print(" Flag 2: ");
        Serial.println(flag2);
        tempContent += "<p class=\"input\">No data has been set, press the back button on your browser to reinput data";
        tempContent += "</p>";
        content += "Uns";
      }
      else {
        tempContent += "<p class=\"input\">Restarting your Love Link you can close this webpage";
        tempContent += "</p>";
        content += "S";
      }
      content += "uccessful Setup</h1>";
      content += "</div>";
      content += "<div class=\"contact-form\">";
      content += "<div class=\"input-fields\">";
      content += tempContent;
      content += "</div>";
      content += "</div>";
      content += "</div>";
      content += "</body>";
      content += "</html>";
      if (!flag || flag2) {
        server.send(200, "text/html", content);
        return;
      }
      EEPROM.commit();
      server.send(200, "text/html", content);
      checkmark();
      delay(1000);
      clearStrip();
      ESP.restart();
    });
  }
}
