class Screen1 {
  //SpriteBill sprBill;
  //SpriteEn sprEn;
  String sFile;
  PImage imgBG1, imgBG2;
  int nW = width, nH, nX1, nX2, nY1, nY2, nSide, nDir = 0;
  float fDx, fDy;
  Screen1() {
    imgBG1 = loadImage("background.jpg");
    imgBG2 = loadImage("background.jpg");
    sprBill=new SpriteBill("bill.png", width/2 - 100, height - 150, 150, 100);
    sprEn=new SpriteEn("gooStache.png", width-300, height-150, 200, 150);
    imgBG1.resize(1500, 1000);
    imgBG2.resize(1500, 1000);
    nX2 = nW;
  }
  //  void update() {
  //    image (imgBG1, nX1, nY1);
  //    image (imgBG2, nX2, nY2);
  //    sprBill.update(0, 0);
  //    pltOne.update(0, 0);
  //  }
  void update() {
    sprBill.update();
    sprEn.update();
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
