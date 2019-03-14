/*are you dumb or something??You dont have that led matrix or anything :3 */

import kinect4WinSDK.Kinect;
import kinect4WinSDK.SkeletonData;
//import processing.serial.*;
//import cc.arduino.*;

//Arduino arduino;
Kinect kinect;

int w=640;
int h=480;
int x=0;
int y=0;
int sclX=w/16;
int sclY=h/16;

void setup(){
  size(640,480);
  kinect = new Kinect(this);
  //println(Arduino.list());
  //arduino = new Arduino(this, Arduino.list()[0], 57600);
  //for (int i = 0; i <= 256; i++){
  //  arduino.pinMode(i, Arduino.OUTPUT);
  //}
    
}
void draw(){
  background(25);
  strokeWeight(2);
  PImage img=kinect.GetMask(); 
  for(int x=0;x<img.width;x+=sclX){
    for(int y=0;y<img.height;y+=sclY){
       int index=x+y*img.width;
       //int pin=20;
       //arduino.digitalWrite(pin, Arduino.HIGH);
       float b=brightness(img.pixels[index]);
       color c=img.pixels[index];
       fill(c);
       rect(x,y,sclX,sclY);
    }
  }
}