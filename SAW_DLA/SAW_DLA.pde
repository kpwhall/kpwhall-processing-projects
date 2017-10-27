// Kyle Hall 2017

//TODO: Implement some way of stopping the program. MaxSteps, Stop button, restart button

final int pixelSize = 4;
final color seedColor = color(255); //Seed is white

int[] pos = { 0, 0 };
boolean[][] seedGrid;
boolean[][] currentGrid;

color currentColor;
int rand, transX, transY;

void setup() {
    size(600,600);
    
    seedGrid = new boolean[width/pixelSize][height/pixelSize];
    currentGrid = new boolean[width/pixelSize][height/pixelSize];
    
    for( int i = 0 ; i < width/pixelSize ; i++ ){  //Set both grids to false
        for( int j = 0  ; j < height/pixelSize ; j++ ){
            seedGrid[i][j]=false;
            currentGrid[i][j]=false;
        }
    }
    
    seedGrid[width/(2*pixelSize)-pixelSize][height/(2*pixelSize)-pixelSize]=true; //Set seed in middle
    resetWalker(); // Initialize first walker
}

void draw() {
  translate(transX, transY);  //Start in the middle
  background(0); // Set background to black
  
  move();  // Call move function
  
  for( int i = 0 ; i < width/pixelSize ; i++ ){  //Set both grids to false
     for( int j = 0  ; j < height/pixelSize ; j++ ){
            fill(seedColor);
            stroke(seedColor);
            
            if(seedGrid[i][j]) {
               rect(i*pixelSize,j*pixelSize,pixelSize,pixelSize);
            }
            
            fill(currentColor);
            stroke(currentColor);
            
            if(currentGrid[i][j]){
               rect(i*pixelSize,j*pixelSize,pixelSize,pixelSize);
            }
     }
  }
  
  if(currentColor==color(255,0,0) || currentColor==color(0,255,0)){
     resetWalker(); 
  }
}

void resetWalker(){
   for( int i = 0 ; i < width/pixelSize ; i++ ){  //Set both grids to false
     for( int j = 0  ; j < height/pixelSize ; j++ ){
        currentGrid[i][j]=false;
     }
   }
   
   pos[0] = (int) random(width/pixelSize - pixelSize);
   pos[1] = (int) random(height/pixelSize - pixelSize);
   
   currentGrid[pos[0]][pos[1]]=true;
   currentColor=color(0,255,255);
}

void move(){
  rand=(int) random(4);
  
  if(currentGrid[pos[0]][pos[1]+1] && currentGrid[pos[0]][pos[1]-1] && currentGrid[pos[0]+1][pos[1]] && currentGrid[pos[0]-1][pos[1]] ){ //Dead End
     currentColor=color(255,0,0);
     return;
  }
  
  try{
    if(rand==0 && (!currentGrid[pos[0]+1][pos[1]])){
    pos[0]+=1;
  } else if(rand==1 && (!currentGrid[pos[0]][pos[1]+1])){
    pos[1]+=1;    
  } else if(rand==2 && (!currentGrid[pos[0]-1][pos[1]])){
    pos[0]-=1;    
  } else if(rand==3  && (!currentGrid[pos[0]][pos[1]-1])){
    pos[1]-=1;    
  }
  
  } catch(ArrayIndexOutOfBoundsException e) {
    currentColor=color(255,0,0);
    return;
  }
  
  if(pos[0] <= 0 || pos[1] <= 0 || pos[0] >= (width/pixelSize)-pixelSize || pos[1] >= (height/pixelSize)-pixelSize){ //Outside grid
    currentColor=color(255,0,0);
    return;
  }
  
  currentGrid[pos[0]][pos[1]]=true;  //Set grid positions to true for current walker
  currentGrid[pos[0]][pos[1]]=true;
  
  if(seedGrid[pos[0]][pos[1]+1] || seedGrid[pos[0]][pos[1]-1] || seedGrid[pos[0]+1][pos[1]] || seedGrid[pos[0]-1][pos[1]] ){
     currentColor=color(0,255,0);
     growSeed();
     return;
  }
}

void growSeed(){
   for( int i = 0 ; i < width/pixelSize ; i++ ){  //Set both grids to false
     for( int j = 0  ; j < height/pixelSize ; j++ ){
        if(currentGrid[i][j]){
           seedGrid[i][j]=true; 
        }
     }
   }
}