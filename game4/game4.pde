PImage background; 
int bgX=0; //global variable background location


// instances of an object
Alien alien1;
Defender defend1;
Bullet bullets;

void setup(){
  size(800,400);
  background = loadImage("spaceBackground.jpg");
  background.resize(width,height); //set image to be same size as the canvas



// put allien in the middle


alien1 = new Alien(width/2, height/2);
defend1 = new Defender(0,height/2);
bullets = new Bullet(0,height/2);

}
 
void draw ()
{
    //scrolling background image
    image(background, bgX, 0); //draw image to fill the canvas
    //draw image again off the right of the canvas
    image(background, bgX+background.width, 0);    
    bgX = bgX- 4;
    if(bgX == -background.width) //if first image completely off the canvas
    {
      bgX=0; //reset back to initial value background
    }
    
    //draw allien at current position
    alien1.render();
    defend1.render();
    bullets.render();
    //bullets.keyPressed();
    
    // move alien with background
    alien1.x=alien1.x-4;
    if(alien1.x == -background.width)//set alien back to initial position if the alien dissapear of left end edge
    {
      alien1.x = width;
    }
}

void keyPressed() {
  if (key == CODED) {
    
    if (keyCode == UP) {
      defend1.y=defend1.y-10; // moves the defender 10 pixels up the screen
      bullets.y=bullets.y-10;
      
    } else if (keyCode == DOWN) {
      defend1.y=defend1.y+10; // moves the defender 10 pixes down the screen
      bullets.y=bullets.y+10;
    } 
      else if (keyCode == RIGHT){
        defend1.x = defend1.x + 10; // moves the defender 10 pixels right
        bullets.x = bullets.x +10; 
      }
      else if (keyCode == LEFT){
        defend1.x = defend1.x - 10; // moves the defender 10 pixels left
        bullets.x = bullets.x -10; // moves the bullets together with the defender
      }
  }
  
}

  // crash function 
  void crash(){
    
    
  }   // end of crash function
    
