Bg bg; //<>//
Sprite sprGoo, sprMario, sprDon; //<>//
Platform pltDon;
int nDx, nDy, nSide, nScroll = 1; // 1 for top, 2 for bottom, 3 for side
boolean canJump = true;

void setup () {
  size (800, 600);
  pltDon = new Platform("hair.jpg", 250, 350, 100, 150);
  sprMario = new Sprite("Mario.jpg", 0, 400, 100, 100);
  frame.requestFocus();
  bg = new Bg("ultra.jpg", 800, 600);
}

void draw() {
  if (sprMario.nX >= 600 && nScroll == 1) {
    bg.update (-2);
  } else if (sprMario.nX <= 100 && nScroll == 1) {
    bg.update (2);
  } else if (nScroll == 0) {
    bg.update (0);
  } else {
    bg.update (0);
  }

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

  if (keyCode == RIGHT && sprMario.nX <= 100) {
    nScroll = 0;
  } else if (keyCode == LEFT && sprMario.nX >= 600) {
    nScroll = 0;
  } else {
    nScroll = 1;
  }
}

void keyReleased()
{
  //sprMario.update(0, 0);
}
