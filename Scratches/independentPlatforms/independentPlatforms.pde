 Bg backgrnd; //<>//
Sprite sprBill;
Platform pltOne, pltMove;
Wall wLeft, wRight, wBot;
int nDx, nDy, nSide, nSide2, nScroll = 0, nScreen=0, nStartClick; // 1 for top, 2 for bottom, 3 for side
boolean canJump = true;

void setup () {
  size (1500, 1000);
  pltOne = new Platform("Plank.png", 200, 800, 80, 300);
  pltMove=new Platform("Plank.png", 500, 400, 80, 300);
  sprBill = new Sprite("Bill.png", 0, 400, 150, 100);
  frame.requestFocus();
  backgrnd = new Bg("background.jpg", 1500, 1000);
}

void draw() {
  if (nScreen == 1) {
    sprBill.update();
    pltOne.update();
    pltMove.update();
  }
  if (sprBill.nX >= 750 && nScroll == 1) {
    backgrnd.update (-2);
    pltOne.update(-2, 0);
    pltMove.update(-2, 0);
  } else if (sprBill.nX <= 50 && nScroll == 1) {
    backgrnd.update (2);
    pltOne.update(2, 0);
    pltMove.update(2, 0);
  } else if (nScroll == 0) {
    backgrnd.update (0);
    pltOne.update(0, 0);
    pltMove.update(0, 0);
  } else {
    backgrnd.update (0);
  }

  sprBill.update();
  pltOne.update();
  pltMove.update();
  nSide = pltOne.nHit(sprBill);
  nSide2=pltMove.nHit(sprBill);
  if (nSide ==1) {
    sprBill.backUpY();
  } else if (nSide ==2) {
    sprBill.bumpHead();
  } else if (nSide ==3 && sprBill.nDx >0) {
    sprBill.backUpX();
  } else if (nSide ==4 && sprBill.nDx <0) {
    sprBill.backUpX();
  }

  if (nSide2 == 1) {
    sprBill.backUpY();
  } else if (nSide2 == 2) {
    sprBill.bumpHead();
  } else if (nSide2 == 3 && sprBill.nDx >0) {
    sprBill.backUpX();
  } else if (nSide2 == 4 && sprBill.nDx <0) {
    sprBill.backUpX();
  }
}

void keyPressed() {
  if (key == 'd') {
    sprBill.setDx(2);
  } else if (key == 'a') {
    sprBill.setDx(-2);
  } else if (key == 's') {
    //sprBill.update(0, 3);
  } else if (key == 'w' && sprBill.canJump == true) { 
    sprBill.canJump = false;
    //if (canJump) {
    sprBill.setDy(-30);
    //}
  }

  if (key == 'd' && sprBill.nX >= width - (100 + sprBill.nW)) {
    nScroll = 1;
  } else if (key == 'a' && sprBill.nX <= 100) {
    nScroll = 1;
  } else {
    nScroll = 0;
  }
}

void keyReleased() {

  if (key == 'd') {
    sprBill.setDx(0);
    nScroll=0;
  } else if (key == 'a') {
    sprBill.setDx(0);  
    nScroll=0;
  } else if (key == 's') {
    //sprBill.update(0, 3);
  } else if (key == 'w' && sprBill.canJump ) { 
    sprBill.canJump = false;
    //if (canJump) {
    sprBill.setDy(0);
    //}
  }
}
