import kinect4WinSDK.Kinect;
import kinect4WinSDK.SkeletonData;

Kinect kinect;

PImage test;

void setup()
{
  size(320, 240);
  background(0);
  kinect = new Kinect(this);
  smooth();
  test = loadImage("kc.jpg");
}

void draw()
{ 
  background(0);
  image(test, 0, 0, 320, 240);
  image(kinect.GetMask(), 0, 0, 320, 240);

}