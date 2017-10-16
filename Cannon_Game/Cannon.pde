class Cannon {
  float angle;
  int cannonX, cannonY, cannonSize;
  int barrelX, barrelY, barrelLength, barrelWidth;
  
  
  Cannon(int cannonX, int cannonY, int cannonSize, int barrelX, int barrelY, int barrelLength, int barrelWidth, float angle) {
    this.cannonX=cannonX;
    this.cannonY=cannonY;
    this.cannonSize=cannonSize;
    this.barrelX=barrelX;
    this.barrelY=barrelY;
    this.barrelLength=barrelLength;
    this.barrelWidth=barrelWidth;
    this.angle=angle;
  }
  
  //TODO: Getters and Setters
  
  void display() {
  
  pushMatrix();
  
  fill(0);
  stroke(0);
  arc(this.cannonX,this.cannonY,this.cannonSize,this.cannonSize,-PI/2,0);
  rotate(this.angle);
  rect(this.barrelX,this.barrelY,this.barrelLength,this.barrelWidth);
  
  //rect(330,240,20,50);
  
  popMatrix(); 
  
  }
  
}