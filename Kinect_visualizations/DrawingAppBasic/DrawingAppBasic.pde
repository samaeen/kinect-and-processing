import kinect4WinSDK.Kinect;

Kinect kinect;

void setup() {
  size(640, 480);
  kinect = new Kinect(this);
  noStroke();
  smooth();
  background(0);
}
void draw() { 
    PImage img=kinect.GetImage();
    //image(img, 0, 0, width, height);
    int brightestX = 0; 
    int brightestY = 0; 
    float brightestValue = 0;
    img.loadPixels();
    int index = 0;
    for (int y = 0; y < img.height; y++) {
      for (int x = 0; x < img.width; x++) {
        int pixelValue = img.pixels[index];
        float pixelBrightness = brightness(pixelValue);
        if (pixelBrightness > brightestValue) {
          brightestValue = pixelBrightness;
          brightestY = y;
          brightestX = x;
        }
        index++;
      }
    }
    fill(255, 204, 0, 128);

    if(keyPressed){
      if(key=='b'||key=='B'){
       //background(0);
       fill(0);
      }
    }
    ellipse(brightestX, brightestY, 20, 20);

    
  }