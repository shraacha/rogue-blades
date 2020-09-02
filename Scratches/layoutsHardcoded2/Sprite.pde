class Sprite {
  float fAccel;
  float fVelocity, fVelocityMax;
  float fX, fY, fXStart, fYStart, fTravelledX, fTravelledY;
  int nDirec, nSpeed;
  int nH, nW, nG, nStartX, nStartY;

  boolean canJump, bCanMovePlt = true, lastOnGround;

  String sFile;
  PImage img;

  Platform p;

  PVector vPos;
  PVector[] vD = new PVector[3];
  // ================================= CONSTRUCTOR =========================
  Sprite(String _sFile, float _fX, float _fY, int _nW, int _nH, float _fVelocity, float _fVelocityMax, float _fAccel, int _nDirec, int _nSpeed) {
    nW = _nW;
    nH = _nH;
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
    vD[1] = new PVector(nSpeed, 0);
    vD[2] = new PVector(-nSpeed, 0);
  }
  // ================================= SET ___ =========================
  /*public void setDx(int _nDX) {
   nDX = _nDX;
   }
   public void setDy(int _nDY) {
   nDY = _nDY;
   }*/
  // ================================= UPDATE =========================
  public void update() {
    move();
    gravity();
    display();
  }
  // ================================= COLLISION: OUT =========================
  public void collOut() {
  }
  // ================================= COLLISION: LEFT =========================
  public void collLeft() {
    if (nDirec == 1) {
      nDirec = 0;
      vPos.x -= (fTravelledX - 0.2);
      vPos.x = fXStart;
      refreshCoord();
    }
  }
  // ================================= COLLISION: RIGHT =========================
  public void collRight() {
    if (nDirec == 2) {
      nDirec = 0;
      vPos.x += (fTravelledX + 0.2);
      vPos.x = fXStart;
      refreshCoord();
    }
  }
  // ================================= COLLISION: TOP =========================
  public void collTop() {
    vPos.y = fYStart;
    vPos.y -= 0.2;
    fVelocity = 0;
    canJump = true;
    refreshCoord();
    // println(nY); //used for debugging
  }
  // ================================= COLLISION: GROUND =========================
  public void collGround() {
    //vPos.y = 725;
    vPos.y = fYStart;
    vPos.y -= 0.2;
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
  // ============== GRAVITY =============================================
  void gravity() {
    fVelocity += fAccel;
    if (fVelocity >= fVelocityMax) {
      fVelocity = fVelocityMax;
    }
    vPos.y += fVelocity;
    println(fVelocity);
    refreshCoord();
  }
  // ============== REFRESH COORDINATES =============================================
  void refreshCoord() {
    fX = vPos.x;
    fY = vPos.y;
  }
  // ============== MOVE =============================================
  void move() {
    fXStart = vPos.x;
    fYStart = vPos.y;
    fTravelledX = vPos.x - fXStart;
    fTravelledY = vPos.y - fYStart;
    vPos.add(vD[nDirec]);
    refreshCoord();
  }
  // ============== DISPLAY =============================================
  void display() {
    //pushMatrix(); // Screen 1 completely breaks without this
    //translate(vPos.x, vPos.y);
    //image(img, 0, 0);
    //popMatrix();
    image(img, vPos.x, vPos.y);
  }
  // ============== JUMP =============================================
  void jump() {
    vPos.y -= 0.4;
    if (canJump == true) {
      fVelocity = -21;
    }
    refreshCoord();
  }
}
