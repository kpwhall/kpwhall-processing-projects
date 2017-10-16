class Basket {
  private int bottomTrim, topSize, depth;
  private int posX, posY;
  
  
  Basket(int posX, int posY, int topSize, int bottomTrim, int depth) {
     this.topSize=topSize;
     this.bottomTrim=bottomTrim;
     this.posX=posX;
     this.posY=posY;
     this.depth=depth;
  }
  
  int getPosX() {
    return this.posX; 
  }
  
  int getPosY() {
    return this.posY ;
  }
  
  int getTopSize() {
    return this.topSize; 
  }
  
  int getBottomTrim() {
    return  this.bottomTrim; 
  }
  
  int getDepth() {
    return this.depth; 
  }
  
  void setPosX(int posX) {
     this.posX=posX; 
  }
  
  void setPosY(int posY) {
    this.posY=posY; 
  }
  
  void setTopSize(int topSize) {
    this.topSize=topSize; 
  }
  
  void setBottomTrim(int bottomTrim) {
    this.bottomTrim=bottomTrim; 
  }
  
  void setDepth( int depth ) {
    this.depth=depth; 
  }
  
  void display() {
    pushMatrix();
    
    stroke(0);
    
    line(posX,posY,posX+bottomTrim,posY+depth);
    line(posX+bottomTrim,posY+depth,posX+topSize-bottomTrim,posY+depth);
    line(posX+topSize-bottomTrim,posY+depth,posX+topSize,posY);
    
    popMatrix();
  }
}