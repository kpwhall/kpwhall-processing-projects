class Button {
  private int posX, posY, value;
  private int sizeX, sizeY;
  private String text;
  
  Button(int posX, int posY, int sizeX, int sizeY , String text) {
    this.posX=posX;
    this.posY=posY;
    this.sizeX=sizeX;
    this.sizeY=sizeY;
    this.text=text;
  }
  
  int getValue() {
    return this.value; 
  }
  
  void setValue(int val) {
    this.value=val; 
  }
  
  void addValue() { 
    this.value++;
  }
  
  void subValue() {
    this.value--; 
  }
  
  boolean hover() {
    if ((this.posX < mouseX) && (mouseX < this.posX+this.sizeX) && (this.posY < mouseY) && (mouseY < this.posY+this.sizeY)) {
      return true;
    } else {
      return false;
    }
  }
  
  void display() {
    
    pushMatrix();
    
    if(this.hover()){
      fill(200); 
    } else {
      fill(100);
    }
    
    rect(posX,posY,sizeX,sizeY);
    text(text,posX,posY);
      
    popMatrix();
    
  }
}