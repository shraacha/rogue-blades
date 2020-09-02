Bg backgrnd; //<>// //<>//
Sprite sprBill;
Screen sprStart;
Button sprStartButton;
Platform pltOne;
Wall wllPlt;
int nDx, nDy, nSide, nSide2, nScroll = 1, nScreen = 0, nStartClick; // 1 for top, 2 for bottom, 3 for side
boolean canJump = true;

void setup () {
  size (1500, 1000);
  pltOne = new Platform("Plank.png", 200, 800, 80, 300);
  sprBill = new Sprite("Bill.png", 0, 400, 150, 100);
  sprStart = new Screen("startingBackground.jpg");
  sprStartButton = new Button("blankButton.png", (width/2 - 200), height/2, 400, 200);
  wllPlt=new Wall("Nothing.png", 200, 800, 80, 300);
  frame.requestFocus();
  backgrnd = new Bg("background.jpg", 1500, 1000);
}

void draw() {
  if (nScreen == 0) {
    sprStart.update();
    sprStartButton.update();
    if (nStartClick == 1) {
      nScreen = 1;
    } else {
      nScreen = 0;
    }
  }
  if (nScreen == 1) {
    sprBill.update();
    pltOne.update();
    wllPlt.update();

    nSide = pltOne.nHit(sprBill);

    if (sprBill.nX >= 750 && nScroll == 1) {                        // background scrolling
      backgrnd.update (-2);
    } else if (sprBill.nX <= 50 && nScroll == 1) {
      backgrnd.update (2);
    } else if (nScroll == 0) {
      backgrnd.update (0);
    } else {
      backgrnd.update (0);
    }

    if (nSide ==1) {                                               // 
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
}

void keyPressed() {
  if (keyCode == RIGHT) {
    sprBill.setDx(2);
  } else if (keyCode == LEFT) {
    sprBill.setDx(-2);
  } else if (keyCode == DOWN) {
    //sprBill.update(0, 3);
  } else if (keyCode == UP && sprBill.canJump ) { 
    sprBill.canJump = false;
    //if (canJump) {
    sprBill.setDy(-30);
    //}
  }

  if (keyCode == RIGHT && sprBill.nX <= 100) {
    nScroll = 0;
  } else if (keyCode == LEFT && sprBill.nX >= 600) {
    nScroll = 0;
  } else {
    nScroll = 1;
  }

  if (sprStartButton.isClicked() == true && keyCode == RIGHT) {
    nStartClick = 1;
  } else {
    nStartClick = 0;
  }
}

void keyReleased()
{
  if (keyCode == RIGHT) {
    sprBill.setDx(0);
  } else if (keyCode == LEFT) {
    sprBill.setDx(0);
  } else if (keyCode == DOWN) {
    //sprBill.update(0, 3);
  } else if (keyCode == UP && sprBill.canJump ) { 
    sprBill.canJump = false;
    //if (canJump) {
    sprBill.setDy(0);
    //}
  }
}

void mousePressed () {
  if (mouseButton == LEFT && sprStartButton.isClicked()==true) {
    nScreen=1;
  }
}
