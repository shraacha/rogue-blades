class Screen1 {
  Platform pltGrnd, pltTop, pltLeft, pltRight;
  Wall wNextRight;
  //Sprite sprBill;
  String sFile;
  PImage imgBG1, imgBG2;

  int nW = width, nH, nX1, nX2, nY1, nY2;
  int nSideUD, nSideLR, nSideUD2, nSideLR2, nSideUD3, nSideLR3, nSideUD4, nSideLR4;
  int nPlatNum;          // number of platforms on the stage

  float fDx, fDy;

  // =============================== CONSTRUCTOR ================================
  Screen1() {
    imgBG1 = loadImage("background.jpg");
    //imgBG2 = loadImage("background.jpg");
    imgBG1.resize(1200, 800);
    //imgBG2.resize(1500, 1000);
    nX2 = nW;
    
    wNextRight = new Wall("wall.png", 1180, 500, 20, 750);
    
    pltGrnd = new Platform("plank.png", 0, 750, 1200, 50);
    pltTop = new Platform("plank.png", 0, 0, 1200, 50);
    pltLeft = new Platform("plank.png", 0, 50, 50, 700);
    pltRight = new Platform("plank.png", 1150, 50, 50, 500);
  }
  // =============================== UPDATE ================================
  void update() {

    image (imgBG1, nX1, nY1);

    wNextRight.update();
    collCheckNxtLvl();
    
    pltGrnd.update();
    pltTop.update();
    pltLeft.update();
    pltRight.update();
    
    sprHero.update();

    println(sprHero.vPos.x, sprHero.vPos.y);
  }
  // ============== COLLISION-CHECK NEXT LEVEL ============================================
  void collCheckNxtLvl() {
    if (wNextRight.isHit(sprHero, wNextRight) == true){
      nScreen = 2;
      sprHero.respawn(0);
    }
    
  }
  // ============== COLLISION-CHECK UP & DOWN =============================================
  void collCheckUpDown() {
    if (sprHero.vPos.y >= height - sprHero.nH) {
      sprHero.collGround();
    }

    nSideUD = pltGrnd.nHitUD(sprHero);
    nSideUD2 = pltTop.nHitUD(sprHero);
    nSideUD3 = pltLeft.nHitUD(sprHero);
    nSideUD4 = pltRight.nHitUD(sprHero);

    if (nSideUD == 1) {
      sprHero.collTop();
    } else if (nSideUD == 2) {
      sprHero.collBot();
    }
    
    if (nSideUD2 == 1) {
      sprHero.collTop();
    } else if (nSideUD2 == 2) {
      sprHero.collBot();
    }
    
    if (nSideUD3 == 1) {
      sprHero.collTop();
    } else if (nSideUD3 == 2) {
      sprHero.collBot();
    }
    
    if (nSideUD4 == 1) {
      sprHero.collTop();
    } else if (nSideUD4 == 2) {
      sprHero.collBot();
    }
  }
  // ============== COLLISION-CHECK LEFT & RIGHT =============================================
  void collCheckLeftRight() {
    nSideLR = pltGrnd.nHitLR(sprHero);
    nSideLR2 = pltTop.nHitLR(sprHero);
    nSideLR3 = pltLeft.nHitLR(sprHero);
    nSideLR4 = pltRight.nHitLR(sprHero);

    if (nSideLR == 3) {
      sprHero.collLeft();
    } else if (nSideLR == 4) {
      sprHero.collRight();
    }
    
    if (nSideLR2 == 3) {
      sprHero.collLeft();
    } else if (nSideLR2 == 4) {
      sprHero.collRight();
    }
    
    if (nSideLR3 == 3) {
      sprHero.collLeft();
    } else if (nSideLR3 == 4) {
      sprHero.collRight();
    }
    
    if (nSideLR4 == 3) {
      sprHero.collLeft();
    } else if (nSideLR4 == 4) {
      sprHero.collRight();
    }
  }
  //===================================KEYPRESSED==================================
  public void pressInput() {
    if (key == 'w' || key == 'W'||keyCode==UP) {
      sprHero.jump();
      sprHero.canJump = false;
    }
    if (key == 'a' || key == 'A'||keyCode==LEFT) {
      sprHero.nDirec = 1; //left
    }
    if (key == 'd' || key == 'D'||keyCode==RIGHT) {
      sprHero.nDirec = 2; //right
    } else {
      //sprHero.nDirec = 0;
    }
  }
  //===================================KEYRELEASED==================================
  public void releaseInput() {
    if ((key=='d'||key=='D')||(key=='a'||key=='A')||keyCode==RIGHT||keyCode==LEFT) {
      sprHero.nDirec = 0;
    }
  }
}
