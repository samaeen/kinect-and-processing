import kinect4WinSDK.Kinect;
import kinect4WinSDK.SkeletonData;

Kinect kinect;

PImage test;

void setup()
{
  size(640, 480,P3D);
  background(0);
  kinect = new Kinect(this);
  smooth();

}

void draw()
{ 


  PImage img1=kinect.GetDepth();
  PImage img=kinect.GetMask();

  background(0);
  int skip=20;
   for(int x=0;x<img.width;x+=skip){
     for(int y=0;y<img.height;y+=skip){
       int index=x+y*img.width;
       color c=img.pixels[index];
       float b=brightness(img1.pixels[index]);
       fill(c);
       float z=map(b,0,255,200,-200);
       float rectSize=map(b,0,255,5,10);
       println(rectSize);
       pushMatrix();
       translate(x,y,z);
       rect(0,0,rectSize,rectSize);
       popMatrix();

     }
   }
   //image(img1, 0, 0, 160, 120);
   //saveFrame();

}