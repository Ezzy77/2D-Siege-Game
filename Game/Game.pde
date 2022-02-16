/**
 
 Invasion game created by Elisio Cabral Sa
 
 The arrow keys controls left and right movement of the player
 Space key drops the weapon 
 
 **/

ArrayList<Arrow> arrows;
Knight knight;
ArrayList<Army> armies;
ArrayList<Sword> swords;

PImage background;
int bgdX = 0; // x-position of background image
int bgdY = 0; // y-position of background image
int playerScore = 0;
int playerLife =10;

PFont font;

void setup()
{
  size(1000, 1000);
  imageMode(CORNER);
  background = loadImage("background.jpg"); //loads from .pde source code directory
  background.resize(width, height); // resize background image
  textSize(30);
  knight = new Knight(width/2, height/4, 5);
  arrows = new ArrayList<>();
  swords = new ArrayList<>();
  armies = new ArrayList<>();

  for ( int i = 0; i<4; i++) {
    arrows.add(new Arrow(random(width), random(height, height+50), 7));
  }

  for (int j=0; j<15; j++) {
    armies.add(new Army(width/9+(50*j), height, 1));
  }
} // end of setup()




void draw()
{
  imageMode(CORNER);
  image(background, bgdX, bgdY); // draw the wall
  statBoard();
  //text("Player: "+ score, 50, 50);

// the follwing block only runs if the the game is not over
  if (!gameOver()) { 
    knight.update();

    for ( int i = 0; i<armies.size(); i++) {
      armies.get(i).update();
      if (knight.isDead(armies.get(i))) {       // check if the armies kill the knight
        playerLife=0;
      }
    }

    for (int i = 0; i<swords.size(); i++) {
      swords.get(i).update();

      if (swords.get(i).isOffScreen()) {       // remove sword object if its outside of the screen
        swords.remove(i);
        i--;
      } else
      {
        for (int j = 0; j< armies.size(); j++) {
          if (swords.get(i).isStab(armies.get(j))) {   // if sword cut armies remove both and increase the score
            armies.remove(j);
            swords.remove(i);
            playerScore++;
            break;
          }
        }
      }
    }

    for ( int g = 0; g<arrows.size(); g++) {
      arrows.get(g).update();
      if (knight.isInjured(arrows.get(g))) {       // if arrows intersect knight, reduce player life level        
        arrows.get(g).x=random(width);            // set arrows position back to the botton of the screen at random location
        arrows.get(g).y= random(height/1.5, height-50);
        playerLife--;
      }
    }
  } // end of gameOver test
  else
  {
    gameOverScreen();
  }
} // end of draw function

void keyPressed() {
  if (  key == ' ') {
    swords.add(new Sword(knight.x, knight.y, 7));    // adds swords object 
  }
  if (key == CODED) {  
    if (keyCode == RIGHT && knight.x<width-20) {  // controls player movement, player is restricted to the screen
      knight.moveRight = true;
    }
    if (keyCode == LEFT && knight.x>=20) {
      knight.moveLeft = true;
    }
  }
} // end of keypressed


void keyReleased() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      knight.moveRight = false;
    } else if (keyCode == LEFT) {
      knight.moveLeft = false;
    }
  }
}  // end of keyReleased method

void statBoard() {
  fill(0);
  rect(0, 0, width, height/7);
  fill(255);
  text("Current Score : "+ playerScore, width/2.5, 50);
  fill(255);
  text("Life Level : "+ playerLife, 0, 50);
  fill(255);
  text("Highest Score : "+ playerScore, width/1.5, 50);
}

boolean gameOver() {
  if (playerLife<=0) {
    return true;
  } else {
    return false;
  }
}

void gameOverScreen() {

  fill(0);
  rect(0, 0, width, height);
  fill(255);
  textSize(100);
  text("GAME OVER", width/3, height/2);
}
