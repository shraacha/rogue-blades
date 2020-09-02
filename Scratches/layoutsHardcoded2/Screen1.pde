class Screen1 {
  Platform pltBorderBot, pltBorderLeft, pltBorderRight;
  //Wall wLeft, wRight, wBot;
  //Sprite sprBill;
  String sFile;
  PImage imgBG1;
  int nW = width, nH, nX1, nX2, nY1, nY2, nSide, nDir = 0;
  int nPlatforms = 0;
  float fDx, fDy;

  // =============================== CONSTRUCTOR ================================
  Screen1() {
    imgBG1 = loadImage("background.jpg");
    //imgBG2 = loadImage("background.jpg");
    imgBG1.resize(800, 800);
    //imgBG2.resize(1500, 1000);
    nX2 = nW;
    pltBorderBot = new Platform("plank.png", 100, 600, 50, 50);
    pltBorderLeft = new Platform("plank.png", 150, 600, 50, 50);
    pltBorderRight = new Platform("plank.png", 750, 0, 50, 800);
  }
  // =============================== UPDATE ================================
  void update() {

    image (imgBG1, 0, 0);

    collisionCheck();
    sprHero.update();

    pltBorderBot.update(int(fDx), int(fDy));
    pltBorderLeft.update(int(fDx), int(fDy));
    pltBorderRight.update(int(fDx), int(fDy));

      //sprHero.vPos.y = 100.0;
      //sprHero.vPos.x = 100.0;
      println(sprHero.vPos.x, sprHero.vPos.y); //sprHero's x and y coordinates keep being increased? | sprHero's (x,y) coordinates are on screen but he is not visible? |
  }
  // ============== COLLISION-CHECK =============================================
  void collisionCheck() {
    if (sprHero.vPos.y >= 800 - 75) {
      sprHero.collGround();
    }

    int nSide = pltBorderBot.nHit(sprHero);
    int nSideTwo = pltBorderLeft.nHit(sprHero);
    int nSideThree = pltBorderRight.nHit(sprHero);

    if (nPlatforms == 0) {
      if (nSide == 1) {
        sprHero.collTop();
      } else if (nSide == 2) {
        sprHero.collBot();
      } else if (nSide == 3) {
        sprHero.collLeft();
      } else if (nSide == 4) {
        sprHero.collRight();
      }
      nPlatforms += 1;
    }

    if (nPlatforms == 1) {
      if (nSideTwo == 1) {
        sprHero.collTop();
      } else if (nSideTwo == 2) {
        sprHero.collBot();
      } else if (nSideTwo == 3) {
        sprHero.collLeft();
      } else if (nSideTwo == 4) {
        sprHero.collRight();
      }
      nPlatforms += 1;
    }
    
    if (nPlatforms == 2) {
      if (nSideThree == 1) {
        sprHero.collTop();
      } else if (nSideThree == 2) {
        sprHero.collBot();
      } else if (nSideThree == 3) {
        sprHero.collLeft();
      } else if (nSideThree == 4) {
        sprHero.collRight();
      }
      nPlatforms = 0;
    }
  }
  //===================================KEYPRESSED==================================
  public void pressInput() {
    if (key == 'w' || key == 'W'||keyCode==UP) {
      sprHero.jump();
      sprHero.canJump = false;
    }
    if (key == 'd' || key == 'D'||keyCode==RIGHT) {
      sprHero.nDirec = 1; //right
    }
    if (key == 'a' || key == 'A'||keyCode==LEFT) {
      sprHero.nDirec = 2; //left
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
