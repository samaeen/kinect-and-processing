import kinect4WinSDK.Kinect;

Kinect kinect;
int pointillize = 16;
  
void setup() {
  size(640, 480);
  kinect = new Kinect(this);
  background(0);
  smooth();
  
}
void draw() {
   PImage img=kinect.GetImage();

  //img.loadPixels();
 // Pick a random point
  int x = int(random(img.width));
  int y = int(random(img.height));
  int loc = x + y*img.width;
  
  // Look up the RGB color in the source image
  loadPixels();
  float r = red(img.pixels[loc]);
  float g = green(img.pixels[loc]);
  float b = blue(img.pixels[loc]);
  noStroke();
  
  // Draw an ellipse at that location with that color
  fill(r,g,b,100);
  ellipse(x,y,pointillize,pointillize);
//image(img,0,0);
}