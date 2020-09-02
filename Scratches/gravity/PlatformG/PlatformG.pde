Sprite sprGoo, sprMario, sprDon; //<>// //<>//
Platform pltDon;
int nDx, nDy, nSide; // 1 for top, 2 for bottom, 3 for side
boolean canJump = true;

void setup () {
  size (800, 600);
  pltDon = new Platform("hair.jpg", 250, 350, 100, 150);
  sprMario = new Sprite("Mario.jpg", 0, 400, 100, 100);
  frame.requestFocus();
}

void draw() {
  background(100);
  //sprMario.update(nDx, nDy);
  sprMario.update();
  pltDon.update();
  // 1 top, 2 bottom, 3 left, 4 right
  nSide = pltDon.nHit(sprMario);
  if (nSide ==1) {
    sprMario.backUpY();
  } else if (nSide ==2) {
    sprMario.bumpHead();
  } else if (nSide ==3 && sprMario.nDx >0) {
    sprMario.backUpX();
  } else if (nSide ==4 && sprMario.nDx <0) {
    sprMario.backUpX();
  }
}

void keyPressed() {
  if (keyCode == RIGHT) {
    sprMario.setDx(1);
  } else if (keyCode == LEFT) {
    sprMario.setDx(-1);
  } else if (keyCode == DOWN) {
    //sprMario.update(0, 3);
  } else if (keyCode == UP && sprMario.canJump ) { //if UP is pressed and nJump=0, make Mario jump up 30 positions 
    sprMario.canJump = false;
    //if (canJump) {
    sprMario.setDy(-32);
    //}
  }
}

void keyReleased()
{
  //sprMario.update(0, 0);
}
