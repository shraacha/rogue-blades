class Sprite {
  float fAccel;
  float fVelocity, fVelocityMax;
  float fX, fY, fXStart, fYStart;
  float fYBumpBack;
  int nDirec, nSpeed;

  int nType; // identufies the type of sprite (hero or Enemy)

  int nH, nW, nG, nStartX, nStartY;

  boolean canJump, bCanMovePlt = true;

  String sFile;
  PImage img;

  Platform p;

  PVector vPos;
  PVector[] vD = new PVector[3];

  Wall wallTop, wallBot, wallLeft, wallRight;
  // ================================= CONSTRUCTOR =========================
  Sprite(String _sFile, float _fX, float _fY, int _nH, int _nW, float _fVelocity, float _fVelocityMax, float _fAccel, int _nDirec, int _nSpeed, int _nType) {
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

    // ========================== ENEMY WALLS ================================ // Walls around the enemy to detect collision
    if (nType == 1) {  // If the sprite is an enemy
      wallTop = new Wall("wall.png", int(fX), int(fY), nW, 10);
      wallBot = new Wall("wall.png", int(fX), int(fY+ nH -10), nW, 10);
      wallLeft = new Wall("wall.png", int(fX), int(fY), 10, nH);
      wallRight = new Wall("wall.png", int(fX + nW -10), int(fY), 10, nH);
    }
  }
  // ================================= UPDATE =========================
  public void update() {
    fXStart = vPos.x;
    fYStart = vPos.y;
    //scr1.collisionCheck();
    move();
    scr1.collCheckLeftRight();
    gravity();
    scr1.collCheckUpDown();
    display();
    
    if (nType == 1) {
      wallTop.update(int(vPos.x), int(vPos.y));
      wallBot.update(int(vPos.x), int(vPos.y+nH-10));
      wallLeft.update(int(vPos.x), int(vPos.y));
      wallRight.update(int(vPos.x+nW-10), int(vPos.y));
    }
  }
  // ================================= COLLISION: LEFT =========================
  public void collLeft() { //protocol the sprite follows if it hits the left side of a wall/platform
    if (nDirec != 1) {
      vPos.x = fXStart;
      refreshCoord();
    }
  }
  // ================================= COLLISION: RIGHT =========================
  public void collRight() {  //protocol the sprite follows if it hits the right side of a wall/platform
    if (nDirec != 2) {
      vPos.x = fXStart;
      refreshCoord();
    }
  }
  // ================================= COLLISION: TOP =========================
  public void collTop() {
    vPos.y = fYStart;
    fVelocity = 0;
    canJump = true;
    refreshCoord();
    // println(nY); //used for debugging
  }
  // ================================= COLLISION: BOTTOM =========================
  public void collBot() {
    fVelocity = 0;
    canJump = false;
    refreshCoord();
  }
  // ================================= COLLISION: GROUND =========================
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
    //pushMatrix(); // Screen 1 completely breaks without this // This sequence is used for rotating objects i believe
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
  // ========================== ENEMY FOLLOW ================================  // Code that gets the enemy sprite to move towards the hero within a range of 200 pixels
  void follow(Sprite s) {
    if (sprHero.fX >= s.fX && s.fX + 200 >= sprHero.fX) {
      nDirec = 2;
    } else if (sprHero.fX <= s.fX && s.fX - 200 <= sprHero.fX) {
      nDirec = 1;
    } else nDirec = 0;
  }
}
