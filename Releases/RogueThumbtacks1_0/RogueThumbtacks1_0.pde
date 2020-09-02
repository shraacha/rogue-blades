Screen1 scr1; // replacing spBackgrnd //<>// //<>//
StartingScreen scrStart;
Button sprStartButton;
int nDx, nDy, nSide, nSide2, nScroll = 1, nScreen=0, nStartClick; // 1 for top, 2 for bottom, 3 for side
boolean canJump = true;

void setup () {
  size (1500, 1000);
  sprStartButton = new Button("StartButton.png", (width/2 - 200), height/2, 400, 200);
  frame.requestFocus();
  scr1 = new Screen1();
  scrStart = new StartingScreen();
}

void draw() {
  if (nScreen == 0) {
    /*sprStart.update();
     sprStartButton.update();
     if (nStartClick == 1) {
     nScreen = 1;
     } else {
     nScreen = 0;
     }*/
    scrStart.update();
  } 
  if (nScreen == 1) {

    sprBill.update();
    pltOne.update();
  }
  if (sprBill.nX >= 750 && sprBackgrnd.nScroll() == 1) {
    sprBackgrnd.update (-2);
    pltOne.update(-2, 0);
  } else if (sprBill.nX <= 50 && sprBackgrnd.nScroll() == 1) {
    sprBackgrnd.update (2);
    pltOne.update(2, 0);
  } else if (nScroll == 0) {
    sprBackgrnd.update (0);
    pltOne.update(0, 0);
  } else {
    sprBackgrnd.update (0);
  }

  nSide = pltOne.nHit(sprBill);

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

  sprBill.update();
  pltOne.update();
}

void keyPressed() {
  if (nScreen == 1) {
    scr1.input();
    if (key == 'd') {
      sprBill.setDx(2);
    } else if (key == 'a') {
      sprBill.setDx(-2);
    } else if (key == 's') {
      //sprBill.update(0, 3);
    } else if (key == 'w' && sprBill.canJump ) { 
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
}

void keyReleased() {
  if (key == 'd') {
    sprBill.setDx(0);
  } else if (key == 'a') {
    sprBill.setDx(0);
  } else if (key == 's') {
    //sprBill.update(0, 3);
  } else if (key == 'w' && sprBill.canJump ) { 
    sprBill.canJump = false;
    //if (canJump) {
    sprBill.setDy(0);
    //}
  }
}
