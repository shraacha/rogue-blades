class Enemy {
  float fAccel;
  float fVelocity, fVelocityMax;
  float fX, fY, fXStart, fYStart;
  float fYBumpBack;
  int nDirec, nSpeed;

  int nH, nW, nG, nStartX, nStartY;

  boolean canJump, bCanMovePlt = true;

  String sFile;
  PImage img;

  Platform p;

  PVector vPos;
  PVector[] vD = new PVector[3];

  Wall wallTop, wallBot, wallLeft, wallRight;  // added this
  // ================================= CONSTRUCTOR =========================
  Enemy(String _sFile, float _fX, float _fY, int _nH, int _nW, float _fVelocity, float _fVelocityMax, float _fAccel, int _nDirec, int _nSpeed) {
    nH = _nH;
    nW = _nW;
    img = loadImage(_sFile);
    img.resize(nW, nH);

    fX = _fX;
    fY = _fY;
    fXStart = fX;
    fYStart = fY;
    vPos = new PVector(fX, fY);

    fAccel = _fAccel;
    fVelocity = _fVelocity;
    fVelocityMax = _fVelocityMax;
    nDirec = _nDirec;
    nSpeed = abs(_nSpeed);
    canJump = true;

    vD[0] = new PVector(0, 0);
    vD[1] = new PVector(-nSpeed, 0);
    vD[2] = new PVector(nSpeed, 0);

    // added this
    wallTop = new Wall("wall.png", int(vPos.x), int(vPos.y), nW, 10);
    wallBot = new Wall("wall.png", int(vPos.x), int(vPos.y+ nH -10), nW, 10);
    wallLeft = new Wall("wall.png", int(vPos.x), int(vPos.y), 10, nH);
    wallRight = new Wall("wall.png", int(vPos.x + nW -10), int(vPos.y), 10, nH);
  }
  // ================================= UPDATE =========================
  public void update() {
    fXStart = vPos.x;
    fYStart = vPos.y;

    //enemWallUpdate();
    

    //scr1.collisionCheck();
    wallRight.update(int(vPos.x+nW-10), int(vPos.y));
    wallLeft.update(int(vPos.x), int(vPos.y));
    
    move();
    scr1.collCheckLeftRight();
    
    wallTop.update(int(vPos.x), int(vPos.y));
    wallBot.update(int(vPos.x), int(vPos.y+nH-10));
    
    gravity();
    scr1.collCheckUpDown();



    display();
  }
  // ================================= COLLISION: LEFT / RIGHT / TOP / BOTTOM / GROUND =========================
  public void collLeft() { //protocol the sprite follows if it hits the left side of a wall/platform
    if (nDirec != 1) {
      vPos.x = fXStart;
      refreshCoord();
    }
  }
  public void collRight() {  //protocol the sprite follows if it hits the right side of a wall/platform
    if (nDirec != 2) {
      vPos.x = fXStart;
      refreshCoord();
    }
  }
  public void collTop() {
    vPos.y = fYStart;
    fVelocity = 0;
    canJump = true;
    refreshCoord();
    // println(nY); //used for debugging
  }
  public void collBot() {
    fVelocity = 0;
    canJump = false;
    refreshCoord();
  }
  public void collGround() {
    vPos.y = fYStart;
    fVelocity = 0;
    canJump = true;
    refreshCoord();
    // println(nY); //used for debugging
  } 
  // ============== GRAVITY =============================================
  void gravity() {
    fVelocity += fAccel;
    if (fVelocity >= fVelocityMax) {
      fVelocity = fVelocityMax;
    }
    vPos.y += fVelocity;
    //println(fVelocity);
    refreshCoord();
  }
  // ============== REFRESH COORDINATES =============================================
  void refreshCoord() {
    fX = vPos.x;
    fY = vPos.y;
  }
  // ============== MOVE =============================================
  void move() {
    vPos.add(vD[nDirec]);
    refreshCoord();
  }
  // ============== DISPLAY =============================================
  void display() {
    //pushMatrix(); // Screen 1 completely breaks without this // This sequence is used for rotating sprites i believe
    //translate(vPos.x, vPos.y); 
    //image(img, 0, 0);
    //popMatrix();
    image(img, vPos.x, vPos.y);
  }
  // ============== JUMP =============================================
  void jump() {
    if (canJump == true) {
      fVelocity = -21;
    }
    refreshCoord();
  }
  // ========================== ENEMY WALL COLLISION ================================    // added this
  public int nEnemHitUD(Sprite s) { // 1 top, 2 bottom
    if (isHit(s, wallTop)) {
      return 1;
    } else if (isHit(s, wallBot)) {
      return 2;
    } else return 0;
  }
  public int nEnemHitLR(Sprite s) { // 3 left, 4 right
    if (isHit(s, wallLeft)) {
      return 3;
    } else if (isHit(s, wallRight)) {
      return 4;
    } else return 0;
  }
  boolean isHit(Sprite one, Wall two) {
    float fX1, fY1, fX2, fY2;
    int nH1, nW1, nH2, nW2;
    fX1 = one.fX;
    fY1 = one.fY; 
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
  // ========================== ENEMY FOLLOW ================================  // Code that gets the enemy sprite to move towards the hero within a range of 200 pixels
  void follow(Enemy e) {
    if (sprHero.fX >= e.fX && e.fX + 200 >= sprHero.fX) {
      nDirec = 2;
    } else if (sprHero.fX <= e.fX && e.fX - 200 <= sprHero.fX) {
      nDirec = 1;
    } else nDirec = 0;
  }
}
