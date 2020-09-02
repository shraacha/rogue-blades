class Sprite {
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
  // ================================= CONSTRUCTOR =========================
  Sprite(String _sFile, float _fX, float _fY, int _nH, int _nW, float _fVelocity, float _fVelocityMax, float _fAccel, int _nDirec, int _nSpeed) {
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
  }
  // ================================= COLLISION: LEFT =========================
  public void collLeft() {
    if (nDirec != 1) {
      vPos.x = fXStart;
      refreshCoord();
    }
  }
  // ================================= COLLISION: RIGHT =========================
  public void collRight() {
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
}
