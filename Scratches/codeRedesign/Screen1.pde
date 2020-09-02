class Screen1 {
  //Platform pltOne;
  //Wall wLeft, wRight, wBot;
  //Sprite sprBill;
  Sprite sprOne, sprPlat;
  String sFile;
  PImage imgBG1, imgBG2;
  int nX1, nX2, nY1, nY2;
  int nAmount = 36; // max number of boxes
  float fDx, fDy;

  ArrayList <Sprite> alBox = new ArrayList<Sprite>();
  // =============================== CONSTRUCTOR ================================
  Screen1() {
    imgBG1 = loadImage("background.jpg");
    //imgBG2 = loadImage("background.jpg");
    imgBG1.resize(width, height);
    //imgBG2.resize(width, height);
    //nX2 = width;
    sprPlat = new Sprite("plank.png", 500.0, 500.0, 100, 100, 0.0, 0.0, 0.0, 0, 0);

    float fX = 0, fY = 0; //poisition of the box
    String sDrawDirec = "Right";

    for (int i= 0; i<nAmount; i++) {
      if (sDrawDirec == "Right") {
        alBox.add(new Sprite("plank.png", fX, fY, 100, 100, 0.0, 0.0, 0.0, 0, 0));
        fX += 100;
        if (fX >= width - nBoxSize) { // nBoxSize has to be subtracted from the Width of the level to show the box
          sDrawDirec = "Down";
        }
      } else if (sDrawDirec == "Down") {
        alBox.add(new Sprite("plank.png", fX, fY, 100, 100, 0.0, 0.0, 0.0, 0, 0));
        fY += 100;
        if (fY >= height) {
          sDrawDirec = "Left";
          // println(fX); // used for debugging
        }
      } else if (sDrawDirec == "Left") {
        alBox.add(new Sprite("plank.png", fX, fY, 100, 100, 0.0, 0.0, 0.0, 0, 0));
        fX -= 100;
        if (fX<=0) {
          sDrawDirec = "Up";
        }
      } else if (sDrawDirec == "Up") {
        alBox.add(new Sprite("plank.png", fX, fY, 100, 100, 0.0, 0.0, 0.0, 0, 0));
        fY -= 100;
        if (fY <= -100) {
          sDrawDirec = "none";
        }
      }
    }
  }
  // =============================== UPDATE ================================
  void update() {
    //fDx = _fDx;
    //fDy = _fDy;
    nX1 += fDx;
    //nX2 += fDx;
    image (imgBG1, nX1, nY1);
    //image (imgBG2, nX2, nY2);
    for (int i = nAmount; i < nAmount; i ++) {
      Sprite sprBox = alBox.get(i);
      sprBox.display();
    }
    
    //checkUpDown();
    sprHero.update();

    /*if (nX1 < - nW) {
     nX1 = nX2 + nW; //move background to the far right
     } else if (nX2 < -nW) {
     nX2 = nX1 + nW; //move background to the far right
     }
     if (nX2 > nW) {
     nX2 = nX1 - nW; //move background to the far left
     } else if (nX1 > nW) {
     nX1 = nX2 - nW; //move background to the far left
     }*/
  }
  // ============== CHECK-UP-DOWN =============================================
  void checkUpDown() {
    for (Sprite nI : alBox) {
      if (isHit(sprHero, nI)) {
        sprHero.fVelocity = 0; // reset velocity
        sprHero.canJump = true; // if you hit the top or bottom of the box, it resets the jump amount
        sprHero.vPos.y = sprHero.fYStart;
      }
    }

    if (isHit(sprHero, sprPlat)) {
      sprHero.fVelocity = 0; // reset velocity
      sprHero.canJump = true; // if you hit the top or bottom of the box, it resets the jump amount
      sprHero.vPos.y = sprHero.fYStart;
    }
  }
  // ============== CHECK-LEFT-RIGHT =============================================
  void checkLeftRight() { 
    for (Sprite nI : alBox) {
      if (isHit(sprHero, nI)) {
        sprHero.vPos.x = sprHero.fXStart;
      }
    }
     if (isHit(sprHero, sprPlat)) {
        sprHero.vPos.x = sprHero.fXStart;
      }
    }
  // ============================= IS-HIT =============================
  boolean isHit(Sprite one, Sprite two) {
    float fX1, fY1, fX2, fY2;
    int nH1, nW1, nH2, nW2;
    fX1 = one.fX;
    fY1 = one.fY; 
    fX2 = two.fX;
    fY2 = two.fY;
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
}
