class Screen1 {
  Platform plt1, plt2;
  Enemy enemy1;
  //Wall wLeft, wRight, wBot;
  //Sprite sprBill;
  String sFile;
  PImage imgBG1, imgBG2;

  int nW = width, nH, nX1, nX2, nY1, nY2;
  int nSideUD, nSideLR, nSideUD2, nSideLR2;

  int nEnemSideLR; // added this

  int nPlatNum;          // number of platforms on the stage

  float fDx, fDy;

  // =============================== CONSTRUCTOR ================================
  Screen1() {
    enemy1 = new Enemy("gooStache.png", width - 100.0, height - 150.0, 50, 50, 0.6, 16.0, 0.8, 0, 1);

    imgBG1 = loadImage("background.jpg");
    //imgBG2 = loadImage("background.jpg");
    imgBG1.resize(800, 800);
    //imgBG2.resize(1500, 1000);
    nX2 = nW;
    plt1 = new Platform("plank.png", 100, 700, 50, 50);
    plt2 = new Platform("plank.png", 150, 700, 50, 50);
  }
  // =============================== UPDATE ================================
  void update() {

    image (imgBG1, nX1, nY1);

    plt1.update();
    plt2.update();
    sprHero.update();

    enemy1.follow(enemy1);
    enemy1.update();

    //println(sprHero.vPos.x, sprHero.vPos.y);
  }
  // ============== COLLISION-CHECK UP & DOWN =============================================
  void collCheckUpDown() {
    if (sprHero.vPos.y >= height - sprHero.nH) {
      sprHero.collGround();
    }

    if (enemy1.vPos.y >= height - enemy1.nH) {
      enemy1.collGround();
    }

    nSideUD = plt1.nHitUD(sprHero);
    nSideUD2 = plt2.nHitUD(sprHero);

    // if (nPlatNum == 0) {
    if (nSideUD == 1) {
      sprHero.collTop();
    } else if (nSideUD == 2) {
      sprHero.collBot();
    }
    // nPlatNum ++;
    //  } else if (nPlatNum == 1) {
    if (nSideUD2 == 1) {
      sprHero.collTop();
    } else if (nSideUD2 == 2) {
      sprHero.collBot();
    }
    //   nPlatNum = 0;
    //}
  }
  // ============== COLLISION-CHECK LEFT & RIGHT =============================================
  void collCheckLeftRight() {
    nSideLR = plt1.nHitLR(sprHero);
    nSideLR2 = plt2.nHitLR(sprHero);

    //if (nPlatNum == 0) {
    if (nSideLR == 3) {
      sprHero.collLeft();
    } else if (nSideLR == 4) {
      sprHero.collRight();
    }
    //nPlatNum ++;
    //} else if (nPlatNum == 1) {
    if (nSideLR2 == 3) {
      sprHero.collLeft();
    } else if (nSideLR2 == 4) {
      sprHero.collRight();
    }
    // nPlatNum = 0;
    // }


    // added this
    nEnemSideLR = enemy1.nEnemHitLR(sprHero);
    if (nEnemSideLR == 3) {
      sprHero.nTemp = 0;
      sprHero.bumpBackLeft();
    } else if (nEnemSideLR == 4) {
      sprHero.nTemp = 0;
      sprHero.bumpBackRight();
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
