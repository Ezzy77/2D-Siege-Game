/**
 Sword class is the subclass of Entity class, it inherites some features from the Super class 
 using "extends" keywords.
 
 swords object is the player weapon used to kill the armies attacker
 **/
 
class Sword extends Entity {
   // member fields
  PImage img;

// object constructor
  Sword(float x, float y, float speed) {
    super(x, y, speed); // inherited constructor arguments
    img = loadImage("sword.png"); //load image  from .pde source code directory
    img.resize(15, 30);// the x and y location of the image
  }

// update() is called during the game to draw image
  void update() {
    render();
    move();
  }
  
  void render() {
    imageMode(CENTER);
    image(img, this.x, this.y);
  }

  void move() {
    this.y += speed;
  }

// isOffScreen() return true or false when the object is outside the screen size
  boolean isOffScreen() {
    if (this.y>= height) {
      return true;
    } else
    {
      return false;
    }
  }
  
  // isStab()is a collision functon.  return true or false when swords object intersect anyarmies object
  boolean isStab(Army armies) {
      if (abs(this.x-armies.x)<=20 && abs(this.y - armies.y)<=20){
        return true;
    }
    return false;
  }
 
} // end of sword class
