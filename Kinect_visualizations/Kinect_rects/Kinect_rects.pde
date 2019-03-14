import kinect4WinSDK.Kinect;
import kinect4WinSDK.SkeletonData;

Kinect kinect; 

void setup(){
 size(640,480,P3D);
  kinect = new Kinect(this);
  
}
void draw(){
 background(0);
   //image(kinect.GetImage(), 320, 0, 320, 240);
   PImage img=kinect.GetDepth();
   //image(img, 0, 0);
   
   int skip=10;
   for(int x=0;x<img.width;x+=skip){
     for(int y=0;y<img.height;y+=skip){
       int index=x+y*img.width;
       //int col=img.pixels[index];
       float b=brightness(img.pixels[index]);
       float z=map(b,0,255,200,-200);
       fill(255);
       
       pushMatrix();
       translate(x,y,z);
       rect(0,0,skip/2,skip/2);
       popMatrix();
     }
   }

}