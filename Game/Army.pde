/**
 Army class is the subclass of Entity class, it inherites some features from the Super class 
 using "extends" keywords.
 
 armies objects the attacker object that are invading a castle protected by a knight, aims to kill the knight or overcome the barrier
 **/

class Army extends Entity {
  // member fields
  PImage img1;
  PImage img2;
  int r = 150;
  boolean canAttack=true;
  int attackDelay =0;

// object constructor
  Army(float x, float y, float speed) {
    super(x, y, speed); // inherited constructor arguments
    img1 = loadImage("pirates1.png"); //loads from .pde source code directory
    img1.resize(30, 55);
    img2 = loadImage("pirates2.png"); //loads from .pde source code directory
    img2.resize(30, 55);
  } // end of knight constructor

// update() is called during the game to draw object
  void update() {
    render();
    move();
   
  } // end of update method


  @Override      // @override annotation just indicate that the object overrides the inherite methods from superclass
    void render() {
    if (counter>0 & counter<=20) {
      imageMode(CENTER);
      image(img1, this.x, this.y);
    } else if (counter>20 & counter<=40) {
      imageMode(CENTER);
      image(img2, this.x, this.y);
    }

    counter += 1;
    if (counter>40) {
      counter =0;
    }
  }
  @Override
    void move() {
    this.y -= speed;
    if (this.y<=0) {
      this.y = height;
    }
  }

// isScape() test if the army reaches/ dissapear from the top of the screen, return true when it does
  boolean isScape() {
    if (this.y<=0) {
      return true;
    } else
    {
      return false;
    }
  }
  
} // end of army class
