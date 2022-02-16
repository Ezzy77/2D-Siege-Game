class Defender{
  
 int x,y,dx,dy;  // location and speed of defender 
 color ALIEN1 = color(0,255,0);
 color ALIEN2 = color(50,100,0);
 
 Defender(int x, int y){     // defender constructor 
   this.x=x;
   this.y=y; 
 } // end of constructor 

// render methods 

void render(){
  //draw a defender:x,y is top left corner, shape is from y..y+30 tall
   fill(0,0,200);
   rect(x,y,20,10); //draw top box
   fill(255,0,0); //draw rocket
   rect(x,y+10,50,20);
   triangle(x+50,y+10,x+50,y+30,x+60,y+20); 
}// end of render methods 
  
 // void crash(){
    
 //   if (ballX == 15) // same x as bat
 //{
 //  if ( abs(ballY – batY) <= 15){
   
 //       deltaX = - deltaX // bounce the ball
 //  }
 //}
 // }// end of 
   
} // end class
