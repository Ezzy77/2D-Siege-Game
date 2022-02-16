class Alien{
  // members var
  int x,y,dx,dy; // location and  speed
  color ALIEN1 = color(0,255,0);
  color ALIEN2 = color(50,100,0);
  

  
  // constructors
  Alien(int x, int y){
    
    this.x = x;
    this.y = y;
  }
  
  
  // methods 
  
  void render(){
    
   fill(ALIEN1);
   ellipse(x,y,30,30);
   fill(ALIEN2);
   ellipse(x,y,50,15);
  } // end of render method
  
  
    
  }// end of allien class

  
  
  
  
