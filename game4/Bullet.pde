class Bullet{
  // members variable
  int x,y,dx;  // bullet position and speed
 
  boolean fire, isvisible;
  
  
  // constructor
  Bullet(int x, int y){
    this.x = x;
    this.y = y;
    isvisible = true; // show the bullet on the screen
    fire = false;
       
  } // end of bullet constructor 
  
  void render(){
    rect(x,y+10,50,20); // draw bullet
    
  } // end of render method
  

  
  
  
} // end of bullet class
