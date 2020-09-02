class Screen1 {
  Platform pltOne;
  Wall wLeft, wRight, wBot;
  Sprite sprBill;
  String sFile;
  PImage imgBG1, imgBG2;
  int nW = width, nH, nX1, nX2, nY1, nY2, nSide, nDir = 0;
  float fDx, fDy;
  Screen1() {
    imgBG1 = loadImage("background.jpg");
    imgBG2 = loadImage("background.jpg");
    imgBG1.resize(1500, 1000);
    imgBG2.resize(1500, 1000);
    nX2 = nW;
    sprBill = new Sprite("bill.png", width/2 - 100, height - 150, 150, 100);
    pltOne = new Platform("nothing.png", 900, 900, 80, 300);
  }
  //  void update() {
  //    image (imgBG1, nX1, nY1);
  //    image (imgBG2, nX2, nY2);
  //    sprBill.update(0, 0);
  //    pltOne.update(0, 0);
  //  }
  void update() {
    //fDx = _fDx;
    //fDy = _fDy;
    nX1 += fDx;
    nX2 += fDx;
    image (imgBG1, nX1, nY1);
    image (imgBG2, nX2, nY2);
    if (nX1 < - nW) {
      nX1 = nX2 + nW; //move background to the far right
    } else if (nX2 < -nW) {
      nX2 = nX1 + nW; //move background to the far right
    }
    if (nX2 > nW) {
      nX2 = nX1 - nW; //move background to the far left
    } else if (nX1 > nW) {
      nX1 = nX2 - nW; //move background to the far left
    }

    nSide = pltOne.nHit(sprBill);

    if (nSide == 1 && nDir != 3) {
      sprBill.backUpY(pltOne);
    } else if (nSide == 2) {
      sprBill.bumpHead();
    } else if (nSide == 3 && nDir != 2) {
      fDx = 0;
    } else if (nSide == 4 && nDir != 1) {
      fDx = 0;
      //  println("right wall");
    }

    //sprBill.update(-int(fDx), int(fDy));
    sprBill.update();
    pltOne.update(int(fDx), int(fDy));
  }
  public void pressInput() {
    if (key == 'd' && nSide != 3) {
      fDx = -4;
      nDir = 1;
    } else if (key == 'a' && nSide != 4) {
      fDx = 4;
      nDir = 2;
    } else if (key == 'w' && sprBill.canJump == true) {
      sprBill.setDy(-30);
      sprBill.canJump = false;
      nDir = 3;
    } else {
      fDx = 0;
      nDir = 0;
    }
  }
  public void releaseInput() {
    if (key == 'd') {
      fDx = 0;
    } else if (key == 'a') {
      fDx = 0;
    } else {
      fDx = 0;
    }
  }
}
