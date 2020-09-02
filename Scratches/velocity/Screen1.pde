class Screen1 {
  Platform pltOne, pltTwo;
  //Wall wLeft, wRight, wBot;
  //Sprite sprBill;
  String sFile;
  PImage imgBG1;
  int nW = width, nH, nX1, nX2, nY1, nY2, nSide, nDir = 0;
  float fDx, fDy;

  // =============================== CONSTRUCTOR ================================
  Screen1() {
    imgBG1 = loadImage("background.jpg");
    //imgBG2 = loadImage("background.jpg");
    imgBG1.resize(800, 800);
    //imgBG2.resize(1500, 1000);
    nX2 = nW;
    pltOne = new Platform("plank.png", 100, 700, 50, 50);
  }
  // =============================== UPDATE ================================
  void update() {
    
    image (imgBG1, 0, 0);

    collisionCheck();
    sprHero.update();

    pltOne.update(int(fDx), int(fDy));


    //sprHero.vPos.y = 100.0;
    //sprHero.vPos.x = 100.0;
    println(sprHero.vPos.x, sprHero.vPos.y); //sprHero's x and y coordinates keep being increased? | sprHero's (x,y) coordinates are on screen but he is not visible? |
  }
  // ============== COLLISION-CHECK =============================================
  void collisionCheck() {
    if (sprHero.vPos.y >= 800 - 75) {
      sprHero.collGround();
    }

    nSide = pltOne.nHit(sprHero);

    if (nSide == 1) {
      sprHero.collTop();
    } else if (nSide == 2) {
      sprHero.collBot();
    } else if (nSide == 3 || nSide == 4) {
      sprHero.collLeftRight();
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
