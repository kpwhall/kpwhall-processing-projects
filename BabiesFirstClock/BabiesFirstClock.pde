// Kyle Hall 2017

void setup() {
  size(400,400);
}

void draw() {
  background(0);  //Make background black.
  
  int hr = hour();  //Get hour, minute, second
  int mn = minute();
  int sc = second();
  
  noFill();  //Remove fill from the shapes I draw
  translate(200,200);  //Translate what I'm drawing to (200,200) on the sktch.
  rotate(-0.5*PI);  //Rotate everything drawn by -PI/2
  
  float endSc = map(sc,0,60,0,2*PI);  //Map the value of second [0,60] to the range of angles [0,2*PI]
  float endMn = map(mn,0,60,0,2*PI);
  float endHr = map(hr % 12 ,0,12,0,2*PI);
  
  strokeWeight(1);  //Set width of line
  stroke(6*sc+5,50,50);  //Set color of line. RGB with R changing with second
  ellipse(0,0,100,100);  //Draw an ellipse centred at current position (0,0) (see transition) with diameter along both x and y of 100
  stroke(50,6*mn+5,50);
  ellipse(0,0,80,80);
  stroke(50,50,30*hr+5);
  ellipse(0,0,60,60);
  
  strokeWeight(10);
  stroke(255,50,50);
  arc(0,0,100,100,endSc-0.05,endSc+0.05);  //Draw an arc centred at (0,0) starting at mapped value endSc-0.5 to endSc+0.5
  
  stroke(50,255,50);
  arc(0,0,80,80,endMn-0.05,endMn+0.05);
  
  stroke(50,50,255);
  arc(0,0,60,60,endHr-0.05,endHr+0.05);
  
  pushMatrix();  //Push and pop creates an isolated area.
  rotate(0.5*PI);  //Thus this rotate only applies between the push and pop
  textAlign(CENTER);
  fill(6*sc+5, 6*mn+5, 30*hr+5, 255);
  text(nf(hr % 12,2) + ":" + nf(mn,2) + ":" + nf(sc,2), 3,5);
  popMatrix();
 
  //saveFrame("frames/####.png") // Uncomment to make videos 
}