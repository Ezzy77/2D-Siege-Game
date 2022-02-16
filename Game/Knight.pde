/**
 Knight class is the subclass of Entity class, it inherites some features from the Super class 
 using "extends" keywords.
 
 knight object is the player character, that can move left and right, and also shoot a sword when key is pressed
 **/
 
class Knight extends Entity {
 // member fields
  PImage img1, img2, img3, img4, img5, img6, img7;
  boolean  moveRight, moveLeft, isCollide, isShot = false;
  
// object constructor
  Knight(float x, float y, float speed) {
    super(x, y, speed); // inherited constructor arguments
    img1 = loadImage("knightStand.png"); //loads from .pde source code directory
    img1.resize(45, 60);
    img2 = loadImage("knightWalkLeft1.png"); //loads from .pde source code directory
    img2.resize(45, 60);
    img3 = loadImage("knightWalkLeft2.png"); //loads from .pde source code directory
    img3.resize(45, 60);
    img4 = loadImage("knightWalkLeft3.png"); //loads from .pde source code directory
    img4.resize(45, 60);
    img5 = loadImage("knightWalkRight1.png"); //loads from .pde source code directory
    img5.resize(45, 60);
    img6 = loadImage("knightWalkRight2.png"); //loads from .pde source code directory
    img6.resize(45, 60);
    img7 = loadImage("knightWalkRight3.png"); //loads from .pde source code directory
    img7.resize(45, 60);
  } // end of knight constructor

// update() is called during the game to draw object
  void update() {
    render();
    move();
  } // end of update method

// update() is called during the game to draw image
  void render() {
    if (moveRight == true) {              // player moves left/right on keypressed, an appropriate image is drawn accordingly
      if (counter>0 & counter<=20) {
        imageMode(CENTER);
        image(img5, this.x, this.y);
      } else if (counter>20 & counter<=40) {
        imageMode(CENTER);
        image(img6, this.x, this.y);
      } else if (counter>40 & counter<=60) {
        imageMode(CENTER);
        image(img7, this.x, this.y);
      }
      // increases the counter so that sequence of image is drawn
      counter += 1;
      if (counter>60) {
        counter =0;
      }
    } else if (moveLeft == true) {

      if (counter>0 & counter<=20) {
        imageMode(CENTER);
        image(img2, this.x, this.y);
      } else if (counter>20 & counter<=40) {
        imageMode(CENTER);
        image(img3, this.x, this.y);
      } else if (counter>40 & counter<=60) {
        imageMode(CENTER);
        image(img4, this.x, this.y);
      }
      counter += 1;
      if (counter>60) {
        counter =0;
      }
    } else {
      imageMode(CENTER);
      image(img1, x, y);
    }
  }

// knight can walk left or right depending on keypressed, speed variable is the walking pace
  void move() {
    if (moveRight == true) {
      this.x += speed;
    } else if (moveLeft == true) {
      this.x -= speed;
    }
  }
  
  
  // isInjured() return true or false when the arrow object intersect knight object, kills/ do damages
  boolean isInjured(Arrow arrows) {
    if (knight != null) // test only if the knight object is not beeen already killed/removed
    {
      if (abs(this.x-arrows.x)<20 && abs(this.y - arrows.y)<20) // if the absolute difference x's value of 2 object is<20
        return true;
    }
    return false;
  }
  
  // isDead() return true or false when the knight object intersect armies object
   boolean isDead(Army armies) {
    if (knight != null) // test only if the knight object is not beeen already killed/removed
    {
      if (abs(this.x-armies.x)<20 && abs(this.y -armies.y)<20) // if the absolute difference x's value of 2 object is<20
        return true;
    }
    return false;
  }
  
  
} // end of Knight class
