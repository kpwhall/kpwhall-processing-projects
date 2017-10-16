// Kyle Hall 2017

// Could be made into a multiplayer game with use of keys
// Could also add drag of different kinds! And Wind?
//Projectile disappears on contact with bottom of basket, adds to a score counter
//Width and position of basket based on score!

boolean overAngUp = false;
boolean overAngDown = false;
boolean overPowerUp = false;
boolean overPowerDown = false;
boolean overFire = false;

float angle, power, gravity;

Button[] buttons = new Button[4];
FireButton fire;
Basket basket;
Cannon cannon;


void setup() {
  size(640,480);
  background(255);
  
  angle=PI/4;
  power=0.0;
  gravity=-9.8;
  
  buttons[0]=new Button(10,10,20,20,"-");
  buttons[1]=new Button(40,10,20,20,"+");
  buttons[2]=new Button(10,40,20,20,"-");
  buttons[3]=new Button(40,40,20,20,"+");
  
  basket = new Basket(300,300,80,20,50);
  
  cannon = new Cannon(0,480,100,330,240,20,50,PI/4);
}

void draw() {
  //Display cannon
  cannon.display();
  
  //Display basket
  basket.display();  
  
  //Display modifier buttons
  for (int i=0 ; i < buttons.length ; i++) {
     buttons[i].display(); 
  }
}

//void update(int x, int y) {
//  if ( angUpHover(addX, addY, addSize) ) {
//    overAngUp = true;
//    overAngDown = overPowerUp = overPowerDown = overFire =false;
//  } else if ( angDownHover(subX, subY, subSize) ) {
//    overAngDown = true;
//    overAngUp = overPowerUp = overPowerDown = overFire =false;
//  }
//  if ( angUpHover(addX, addY, addSize) ) {
//    overAngUp = true;
//    overAngDown = overPowerUp = overPowerDown = overFire =false;
//  } else if ( angDownHover(subX, subY, subSize) ) {
//    overAngDown = true;
//    overAngUp = overPowerUp = overPowerDown = overFire =false;
//  }
//  else {
//    overAngUp = overAngDown = overPowerUp = overPowerDown = overFire =false;
//  }
//}