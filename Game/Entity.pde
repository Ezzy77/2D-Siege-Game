/**
 Entity class is the superclass of all classes 
 
 knight object is the player character, that can move left and right, and also shoot a sword when key is pressed
 **/

abstract class Entity{
   // member fields
  float x;
  float y;
  float speed = 10;
  int counter =0;
  
  
  Entity(float x, float y, float speed){
    this.x= x;
    this.y= y;
    this.speed = speed;
  }
  
  void update(){
    render();
    move();
  }
  
 abstract void render();
  
 abstract void move();
  
} // end of Entity class
