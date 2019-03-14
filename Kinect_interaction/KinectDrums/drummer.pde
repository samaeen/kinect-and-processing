class drummer{
  float xPos,yPos,radius;
  drummer(float x,float y,int r){
    xPos=x;
    yPos=y;
    radius=r;
  }
  void show(){
    ellipse(xPos,yPos,radius,radius);
  }

}