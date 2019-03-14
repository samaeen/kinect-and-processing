import kinect4WinSDK.Kinect;
import kinect4WinSDK.SkeletonData;

Kinect kinect;

PImage test;

void setup()
{
  size(640, 480);
  background(0);
  kinect = new Kinect(this);
  smooth();

}

void draw()
{ 
  background(0);
  image(kinect.GetMask(), 0, 0, 320, 240);
}