class drum{
  int xPos,yPos,radius,colour;
  String songName;
  drum(int x,int y,int r,String sn,int c1){
    xPos=x;
    yPos=y;
    radius=r;
    songName=sn;
    colour=c1;
  }
  void show(){
    fill(0,c1,c1);
    rect(xPos,yPos,radius,radius);
    fill(0,0,c1);
    text(songName,xPos+15,yPos+20);
  }
  boolean intersects(drummer other){
    float d=dist(xPos,yPos,other.xPos,other.yPos);
    if(d<(radius+other.radius)/2){    
      println("touche");
      return true;
    }else{
      
      return false;
    }
  }

}