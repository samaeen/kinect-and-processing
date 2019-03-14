import kinect4WinSDK.Kinect;
import gab.opencv.*;
import java.awt.*;

OpenCV opencv;
Rectangle[] faces;

Kinect kinect;

void setup() {
  size(640, 480);
  opencv = new OpenCV(this, 640, 480);
 //size(opencv.width, opencv.height);

  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  kinect = new Kinect(this);
}

void draw() {
   
  PImage img=kinect.GetImage();
  scale(2);
  opencv.loadImage(img);
  image(img, 0, 0);
  
  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  Rectangle[] faces = opencv.detect();

  for (int i = 0; i < faces.length; i++) {
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
  }
}