class Screen1 {
  //Platform pltOne;
  //Wall wLeft, wRight, wBot;
  //Sprite sprBill;
  String sFile;
  PImage imgBG1, imgBG2;
  int nW = width, nH, nX1, nX2, nY1, nY2, nSide, nDir = 0;
  float fDx, fDy;

  // =============================== CONSTRUCTOR ================================
  Screen1() {
    imgBG1 = loadImage("background.jpg");
    imgBG2 = loadImage("background.jpg");
    imgBG1.resize(1500, 1000);
    imgBG2.resize(1500, 1000);
    nX2 = nW;
    sprBill = new Sprite("bill.png", width/2 - 100, height - 150, 150, 100);
    pltOne = new Platform("plank.png", 900, 700, 80, 300);
  }
  // =============================== UPDATE ================================
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

    nSide = pltOne.nHit(sprHero);

    if (nSide == 1) {
      sprHero.backUpY(pltOne);
    } else if (nSide == 2) {
      sprHero.bumpHead();
    } else if (nSide == 3 && nDir != 2) {
      //fDx = 0;
      sprHero.setDx(0);
    } else if (nSide == 4 && nDir != 1) {
      // = 0;
      sprHero.setDx(0);
      //  println("right wall");
    } else {
    }

    //sprBill.update(-int(fDx), int(fDy));
    sprHero.update();
    pltOne.update(int(fDx), int(fDy));
  }
  // ============== CHECK-UP-DOWN =============================================
  
  // ============================= IS-HIT =============================
  boolean isHit(Sprite one, Wall two) {
    float fX1, fY1, fX2, fY2;
    int nH1, nW1, nH2, nW2;
    fX1 = one.nX;
    fY1 = one.nY; 
    fX2 = two.nX;
    fY2 = two.nY;
    nH1 = one.img.height;
    nW1 = one.img.width;
    nH2 = two.img.height;
    nW2 = two.img.width;
    if (
      ( ( (fX1 <= fX2) && (fX1+nW1 >= fX2) ) ||
      ( (fX1 >= fX2) && (fX1 <= fX2+nW2) ) )
      &&
      ( ( (fY1 <= fY2) && (fY1+nH1 >= fY2) ) ||
      ( (fY1 >= fY2) && (fY1 <= fY2+nH2) ) )
      ) {
      return (true) ;
    } else {
      return (false) ;
    }
  }
  
  public void pressInput() {
    if (key == 'd' && nSide != 3) {
      sprBill.setDx(4);
      nDir = 1;
    } else if (key == 'a' && nSide != 4) {
      //fDx = 4;
      sprBill.setDx(-4);
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
      //fDx = 0;
      sprBill.setDx(0);
    } else if (key == 'a') {
      //fDx = 0;
      sprBill.setDx(0);
    } else {
      //fDx = 0;
      sprBill.setDx(0);
    }
  }
}
