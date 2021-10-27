#include <Adafruit_NeoPixel.h>
#ifdef __AVR__
#include <avr/power.h>
#endif

#define PIN 16

// Parameter 1 = number of pixels in strip
// Parameter 2 = Arduino pin number (most are valid)
// Parameter 3 = pixel type flags, add together as needed:
//   NEO_KHZ800  800 KHz bitstream (most NeoPixel products w/WS2812 LEDs)
//   NEO_KHZ400  400 KHz (classic 'v1' (not v2) FLORA pixels, WS2811 drivers)
//   NEO_GRB     Pixels are wired for GRB bitstream (most NeoPixel products)
//   NEO_RGB     Pixels are wired for RGB bitstream (v1 FLORA pixels, not v2)
//   NEO_RGBW    Pixels are wired for RGBW bitstream (NeoPixel RGBW products)
Adafruit_NeoPixel strip = Adafruit_NeoPixel(64, PIN, NEO_GRB + NEO_KHZ800);

int maxCap = 0;
int touch = 0;
int list_simpleHeart[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0};
// IMPORTANT: To reduce NeoPixel burnout risk, add 1000 uF capacitor across
// pixel power leads, add 300 - 500 Ohm resistor on first pixel's data input
// and minimize distance between Arduino and first pixel.  Avoid connecting
// on a live circuit...if you must, connect GND first.

void setup() {
  // This is for Trinket 5V 16MHz, you can remove these three lines if you are not using a Trinket
#if defined (__AVR_ATtiny85__)
  if (F_CPU == 16000000) clock_prescale_set(clock_div_1);
#endif
  // End of trinket special code
  Serial.begin(115200);
  maxCap = touchRead(4);
  strip.begin();
  strip.setBrightness(50);
  strip.show(); // Initialize all pixels to 'off'
}


// Fill the dots one after the other with a color
void colorWipe(uint32_t c, uint8_t wait) {
  for (uint16_t i = 0; i < strip.numPixels(); i++) {
    strip.setPixelColor(i, c);
    strip.show();
    delay(wait);
  }
}



void simpleHeart() {
  int counter = 0;
  for (int f = 0; f < 2; f++) {
    for (int j = 0; j < 256; j++) {
      for (int i = 0; i < strip.numPixels(); i++) {
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
      if (list_simpleHeart[i]) {
        strip.setPixelColor(i, strip.Color(255 - j, 0, int(256 / 2 - j / 2)));
      }
    }
    strip.show();
    delay(10);
  }
}
void loop() {
  touch = touchRead(4);
  if (maxCap < touch)
    maxCap = touch;
  Serial.println(touch);
  if (touch < maxCap - 3) {
    simpleHeart();
  }
}
