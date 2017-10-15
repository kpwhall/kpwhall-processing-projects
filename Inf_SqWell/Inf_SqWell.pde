
// Kyle Hall 2017

boolean overAdd = false;
boolean overSub = false;
boolean partMin = false;

int addSize = 25;
int subSize = 25;
int addX, addY, subX, subY;
float partX, partY, partDiameter;
int wellWidth, wellDepth;
int n;

color addColor=color(150);
color subColor=color(150);
color addHighlight=color(200);
color subHighlight=color(200);

void setup(){
 size(800,800);
 background(0);
 
 addY=subY=height-100;
 addX=width-50;
 subX=width-150;
 wellWidth=400;
 wellDepth=600;
 partDiameter=5;
 partX=(width-wellWidth)/2;
 partY=height/2-100;
 n=1;
}

void draw(){
  update(mouseX,mouseY);
  clear();
  
  if(overAdd) {
    fill(addHighlight);
  } else {
    fill(addColor);
  }
  
  ellipse(addX,addY,addSize,addSize);
  
  if(overSub) {
    fill(subHighlight);
  } else {
    fill(subColor);
  }
  ellipse(subX,subY,subSize,subSize);
  
  fill(255);
  
  strokeWeight(8);
  stroke(255);
  line(0.5*(width-wellWidth),0,0.5*(width-wellWidth),wellDepth);
  line(width-0.5*(width-wellWidth),0,width-0.5*(width-wellWidth),wellDepth);
  line(0.5*(width-wellWidth),wellDepth,width-0.5*(width-wellWidth),wellDepth);
  
  textAlign(CENTER);
  textSize(20);
  text( "n="+n, width-100, height-90);
  
  fill(0);
  text( "-", width-150, height-95);
  text( "+", width-50, height-95);
  fill(255);
  
  drawParticle();
  
  //saveFrame("frames/####.png");

}

void drawParticle(){
    if(partX==width-0.5*(width-wellWidth)) {
       partMin=false;
    } else if(partX==0.5*(width-wellWidth)) {
       partMin=true;    
    }
    
    if(partMin){
      partX=partX+wellWidth/100;
      partY=400-(1000*sqrt(2.0/wellWidth))*sin((n*PI*(partX-0.5*(width-wellWidth)))/wellWidth);
    } else {
      partX=partX-wellWidth/100;
      partY=400+(1000*sqrt(2.0/wellWidth))*sin((n*PI*(partX-0.5*(width-wellWidth)))/wellWidth);
    }
    
    text(partY/1000,100,100);
    
    text("sin((" + n + " * PI * x) / a)", 400,700);
    
    ellipse(partX,partY,partDiameter,partDiameter);
}

void mousePressed() {
  if (overAdd) {
    addClick();
  }
  if (overSub) {
    subClick();
  }
}

void update(int x, int y) {
  if ( addHover(addX, addY, addSize) ) {
    overAdd = true;
    overSub = false;
  } else if ( subHover(subX, subY, subSize) ) {
    overSub = true;
    overAdd = false;
  } else {
    overSub = overAdd = false;
  }
}

void addClick(){
  n++;
}

void subClick(){
  if(n>1) {n--;}
}

boolean addHover(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}

boolean subHover(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}