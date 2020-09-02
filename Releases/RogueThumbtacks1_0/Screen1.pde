class Screen1 {
  Platform pltOne;
  Wall wLeft, wRight, wBot;
  Sprite sprBill;
  String sFile;
  PImage imgBG1, imgBG2;
  int nW, nH, nX1, nX2, nY1, nY2;
  float fDx;
  Screen1() {
    imgBG1 = loadImage("background.jpg");
    imgBG2 = loadImage("background.jpg");
    imgBG1.resize(1500, 1000);
    imgBG2.resize(1500, 1000);
    nX2 = nW;
    sprBill = new Sprite("Bill.png", 0, 400, 150, 100);
    pltOne = new Platform("Plank.png", 200, 800, 80, 300);
  }
  void update(float _fDx) {
    fDx = _fDx;
    nX1+=fDx;
    nX2+=fDx;
    image (imgBG1, nX1, nY1);
    image (imgBG2, nX2, nY2);
    if (nX1 < -nW) {
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
  public int nScroll() {
    if (key == 'd' && sprBill.nX >= width - (100 + sprBill.nW)) {
      return 1;
    } else if (key == 'a' && sprBill.nX <= 100) {
      return 1;
    } else {
      return 0;
    }
  }
}
