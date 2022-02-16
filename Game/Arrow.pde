/**
 Arrow class is the subclass of Entity class, it inherites some features from the Super class 
 using "extends" keywords.
 
 Arrows object is a 2nd type (class) of attacker objects that must be avoided by the player, collision with 
 the knight object involves lost of life/game over
 **/

class Arrow extends Entity {
   // member fields
  PImage img;

// object constructor
  Arrow(float x, float y, float speed) {
    super(x, y, speed); // inherited constructor arguments
    img = loadImage("arrow.png"); //loads from .pde source code directory
    img.resize(80, 90);
  }

// update() is called during the game to draw object
  void update() {
      render();
      move();
    }

  void render() {
    imageMode(CENTER);
    image(img, this.x, this.y);
  }

  void move() {
    this.y -= speed;
    if(this.y<=height/6){
      this.x=random(width);
      this.y= random(height/1.5,height-50);
    }
  }

// isOffrange() return true or false when the object is outside the screen size
  boolean isOffrange() {
    if (this.y>= 0) {
      return true;
    } else
    {
      return false;
    }
  }
}
