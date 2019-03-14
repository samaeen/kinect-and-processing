import kinect4WinSDK.Kinect;
import kinect4WinSDK.SkeletonData;
import ddf.minim.*;

import ddf.minim.*;

Minim [] minim=new Minim[8];

AudioPlayer boom,clap,hihat,kick,openhat,snare,tink,tom;

int c1=255;


String [] sounds = {"boom","clap","hihat","kick","openhat","snare","tink","tom"};
drum [] drumo=new drum[8];



Kinect kinect;
ArrayList <SkeletonData> bodies;

drum drum1;
drummer drummer2;
int radius1=60;
int radius2=50;

float drummerX;
float drummerY;

void setup()
{
  size(640, 480);
  background(0);
  kinect = new Kinect(this);
  smooth();
  bodies = new ArrayList<SkeletonData>();
  for(int i=0;i<7;i++){
    minim[i]=new Minim(this);
  }

  boom = minim[0].loadFile("DrumSounds/boom.mp3");
  clap = minim[1].loadFile("DrumSounds/clap.mp3");
  kick = minim[3].loadFile("DrumSounds/kick.mp3");
  hihat = minim[2].loadFile("DrumSounds/hihat.mp3");
  openhat = minim[4].loadFile("DrumSounds/openhat.mp3");
  snare = minim[5].loadFile("DrumSounds/snare.mp3");
  
  for(int i=0;i<=3;i++){
    drumo[i]=new drum(100,40+80*i,radius1,sounds[i],c1);
  }
  for(int i=4;i<=7;i++){
    drumo[i]=new drum(400,40+80*(i-4),radius1,sounds[i],c1);
  }
  drummer2=new drummer(drummerX,drummerY,radius2);
}

void draw()
{
  background(0);
  image(kinect.GetImage(), 0, 0);





  for (int i=0; i<bodies.size (); i++) 
  {
    drawSkeleton(bodies.get(i));
    drawPosition(bodies.get(i));
  }
}

void drawPosition(SkeletonData _s) 
{
  noStroke();
  fill(0, 100, 255);
  String s1 = str(_s.dwTrackingID);
  text(s1, _s.position.x*width/2, _s.position.y*height/2);
}

void drawSkeleton(SkeletonData _s) 
{
  drummer2.xPos=_s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_WRIST_RIGHT].x*width;
  drummer2.yPos=_s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_WRIST_RIGHT].y*height;
  for(int i=0;i<=7;i++){
    drumo[i].show();
  }
  drummer2.show();
  if (drumo[0].intersects(drummer2)){
    fill(255,0,0);
    boom.play();
  }
  if (drumo[1].intersects(drummer2)){
    fill(255,0,0);
    clap.play();
  }
  if (drumo[2].intersects(drummer2)){
    fill(255,0,0);
    hihat.play();
  }
    if (drumo[3].intersects(drummer2)){
    fill(255,0,0);
    kick.play();
  }
    if (drumo[4].intersects(drummer2)){
    fill(255,0,0);
    openhat.play();
  }
    if (drumo[5].intersects(drummer2)){
    fill(255,0,0);
    snare.play();
  }
  else{
    boom.close();
    clap.close();
    hihat.close();
    kick.close();
    openhat.close();
    snare.close();
    boom = minim[0].loadFile("DrumSounds/boom.mp3");
    clap = minim[1].loadFile("DrumSounds/clap.mp3");
    kick = minim[3].loadFile("DrumSounds/kick.mp3");
    hihat = minim[2].loadFile("DrumSounds/hihat.mp3");
    openhat = minim[4].loadFile("DrumSounds/openhat.mp3");
    snare = minim[5].loadFile("DrumSounds/snare.mp3");
    fill(0,255,0);
  }  
  drummer2.show();
  //ellipse(_s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_WRIST_RIGHT].x*width,
  //        _s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_WRIST_RIGHT].y*height,20,20);
  // Body
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_HEAD, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_LEFT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_RIGHT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER, 
  Kinect.NUI_SKELETON_POSITION_SPINE);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_LEFT, 
  Kinect.NUI_SKELETON_POSITION_SPINE);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_RIGHT, 
  Kinect.NUI_SKELETON_POSITION_SPINE);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SPINE, 
  Kinect.NUI_SKELETON_POSITION_HIP_CENTER);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_HIP_CENTER, 
  Kinect.NUI_SKELETON_POSITION_HIP_LEFT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_HIP_CENTER, 
  Kinect.NUI_SKELETON_POSITION_HIP_RIGHT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_HIP_LEFT, 
  Kinect.NUI_SKELETON_POSITION_HIP_RIGHT);

  // Left Arm
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_LEFT, 
  Kinect.NUI_SKELETON_POSITION_ELBOW_LEFT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_ELBOW_LEFT, 
  Kinect.NUI_SKELETON_POSITION_WRIST_LEFT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_WRIST_LEFT, 
  Kinect.NUI_SKELETON_POSITION_HAND_LEFT);

  // Right Arm
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_RIGHT, 
  Kinect.NUI_SKELETON_POSITION_ELBOW_RIGHT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_ELBOW_RIGHT, 
  Kinect.NUI_SKELETON_POSITION_WRIST_RIGHT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_WRIST_RIGHT, 
  Kinect.NUI_SKELETON_POSITION_HAND_RIGHT);

  // Left Leg
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_HIP_LEFT, 
  Kinect.NUI_SKELETON_POSITION_KNEE_LEFT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_KNEE_LEFT, 
  Kinect.NUI_SKELETON_POSITION_ANKLE_LEFT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_ANKLE_LEFT, 
  Kinect.NUI_SKELETON_POSITION_FOOT_LEFT);

  // Right Leg
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_HIP_RIGHT, 
  Kinect.NUI_SKELETON_POSITION_KNEE_RIGHT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_KNEE_RIGHT, 
  Kinect.NUI_SKELETON_POSITION_ANKLE_RIGHT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_ANKLE_RIGHT, 
  Kinect.NUI_SKELETON_POSITION_FOOT_RIGHT);
}

void DrawBone(SkeletonData _s, int _j1, int _j2) 
{
  noFill();
  stroke(255, 255, 0);
  if (_s.skeletonPositionTrackingState[_j1] != Kinect.NUI_SKELETON_POSITION_NOT_TRACKED &&
    _s.skeletonPositionTrackingState[_j2] != Kinect.NUI_SKELETON_POSITION_NOT_TRACKED) {
    line(_s.skeletonPositions[_j1].x*width, 
    _s.skeletonPositions[_j1].y*height, 
    _s.skeletonPositions[_j2].x*width, 
    _s.skeletonPositions[_j2].y*height);
  }
}

void appearEvent(SkeletonData _s) 
{
  if (_s.trackingState == Kinect.NUI_SKELETON_NOT_TRACKED) 
  {
    return;
  }
  synchronized(bodies) {
    bodies.add(_s);
  }
}

void disappearEvent(SkeletonData _s) 
{
  synchronized(bodies) {
    for (int i=bodies.size ()-1; i>=0; i--) 
    {
      if (_s.dwTrackingID == bodies.get(i).dwTrackingID) 
      {
        bodies.remove(i);
      }
    }
  }
}

void moveEvent(SkeletonData _b, SkeletonData _a) 
{
  if (_a.trackingState == Kinect.NUI_SKELETON_NOT_TRACKED) 
  {
    return;
  }
  synchronized(bodies) {
    for (int i=bodies.size ()-1; i>=0; i--) 
    {
      if (_b.dwTrackingID == bodies.get(i).dwTrackingID) 
      {
        bodies.get(i).copy(_a);
        break;
      }
    }
  }
}