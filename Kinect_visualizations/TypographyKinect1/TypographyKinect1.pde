import kinect4WinSDK.Kinect;
import kinect4WinSDK.SkeletonData;

Kinect kinect;

void setup()
{
  size(640, 480,P3D);
  background(0);
  kinect = new Kinect(this);
  smooth();

}

void draw()
{ 

  PImage img=kinect.GetDepth();

  background(0);
  int skip=20;
   for(int x=0;x<img.width;x+=skip){
     for(int y=0;y<img.height;y+=skip){
       int index=x+y*img.width;
       float b=brightness(img.pixels[index]);
       float ts=map(b,0,255,6,12);
       if(b>150){
        fill(0);
       }else{
         fill(255);
       }  
       float z=map(b,0,255,200,-200);
       println(z);
       pushMatrix();
       textSize(ts);
       translate(x,y,z);
       text(str(random(1,9)),0,0,0);
       popMatrix();

     }
   }
   //saveFrame();

}