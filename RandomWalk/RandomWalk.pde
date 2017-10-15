// Kyle Hall 2017

//TODO : Add a way to change settings. Add multiple particles.

int[] pos = { 0,0 }; //Current particle position
int[] moveX = { -1,0,1,0 }; // Possible x and y particle movements.
int[] moveY = { 0,-1,0,1 };
int pixelSize=5;
int maxStep=200;

int[][] path = new int[maxStep][2]; //Storage of positions. Capped at 2000
int rand, n;

void setup() {
  size(600,600);
  
  n=0;  //Number of steps taken.
}

void draw() {
  translate(width/2-pixelSize,height/2-pixelSize);  //Start in the middle
  background(0);  //Background is gravscale 0, aka black.
  
  move();  //Call my function.
  
  for (int i = 0 ; i < n ; i++) {  //Draw every pixel. in white
    fill(100+155*i/n);  //Fill and stroke as grayscale based on how old the step is.
    stroke(100+155*i/n);
  
    rect(path[i][0],path[i][1],pixelSize,pixelSize);  //Draw a rectangle in the position of the pixel
  }
  
  fill(255,0,0);  //Fill and stroke as rgb (255,0,0), aka red
  stroke(255,0,0);
  
  rect(pos[0],pos[1],pixelSize,pixelSize); //Draw current position in red
  
  saveFrame("frames/####.png"); // Uncomment to make videos 
}

void move() {
  rand=(int) random(4);  //Get random int from 0 to 3
  
  path[n][0]=pos[0];  //Take the particles current position and store it.
  path[n][1]=pos[1];
  
  pos[0] += pixelSize*moveX[rand];  //Move the particle using the random number.
  pos[1] += pixelSize*moveY[rand];
  
  if (n<maxStep-1){ //If maxStep is reached, start moving line
    n++; //Increase number of steps taken.
  } else {
    for (int i=0 ; i<n ; i++ ) {  //Remove the first element of the array.
      path[i][0]=path[i+1][0];
      path[i][1]=path[i+1][1];
    }
  }
}