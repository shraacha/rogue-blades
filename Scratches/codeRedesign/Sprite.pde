class Sprite {
  float fAccel;
  float fVelocity, fVelocityMax;
  float fX, fY, fXStart, fYStart;
  //int nX, nY, nDX, nDY, 
  int nDirec, nSpeed; 
  int nH, nW, nG, nStartX, nStartY;
  public boolean canJump, bCanMovePlt = true;
  String sFile;
  PImage img;

  //Platform p;

  PVector vPos;
  PVector[] vD = new PVector[3];
  // ================================= CONSTRUCTOR =========================
  Sprite(String _sFile, float _fX, float _fY, int _nH, int _nW, float _fVelocity, float _fVelocityMax, float _fAccel, int _nDirec, int _nSpeed) {
    fX = _fX;
    fY = _fY;
    fXStart = fX;
    fYStart = fY;
    vPos = new PVector(fX, fY);

    nH = _nH;
    nW = _nW;
    img = loadImage(_sFile);
    img.resize(nW, nH);

    fAccel = _fAccel;
    fVelocity = _fVelocity;
    fVelocityMax = _fVelocityMax;
    nDirec = _nDirec;
    nSpeed = abs(_nSpeed);
    nG = 1;
    canJump = true;

    vD[0] = new PVector(0, 0);
    vD[1] = new PVector(nSpeed, 0);
    vD[2] = new PVector(-nSpeed, 0);
  }
  
  // ================================= ====== =========================
  /*public void setDx(int _nDX) {
   nDX = _nDX;
   }*/
  // ================================= ====== =========================
  /*public void setDy(int _nDY) {
   nDY = _nDY;
   }*/
  
  // ================================= UPDATE =========================
  public void update() { // overload update just in case I don't have to change coordinates.
   // scr1.checkUpDown();
    move();
    //scr1.checkLeftRight();
    gravity();
    display();
    /*nG = 1;
     nDY += nG;
     nStartX = nX;
     nStartY = nY;
     nX += nDX;
     nY += nDY;
     image(img, nX, nY);
     if (nY + img.height > height) {
     nY = height - img.height;
     canJump = true;
     nDY = 0;*/
  }
  // ================================= BACKUP =========================
  /*public void backUp() {
   nX = nStartX;
   nY = nStartY;
   }
   public void backUpY(Platform _p) {
   p = _p;
   nY = p.nY - nH - 2;
   nDY = 0;
   canJump = true;
   // println(nY);
   }
   public void bumpHead() {
   nDY = 0;
   nY += 3;
   }*/
  // ============== GRAVITY =============================================
  void gravity() {
    fVelocity += fAccel;
    if (fVelocity >= fVelocityMax) {
      fVelocity = fVelocityMax;
    }
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
    vPos.add(vD[nDirec]);
    refreshCoord();
  }
  // ============== DISPLAY =============================================
  void display() {
    pushMatrix();
    translate(vPos.x, vPos.y);
    image(img, 0, 0);
    popMatrix();
  }
  // ============== JUMP =============================================
  void jump() {
    if (canJump == true) {
      fVelocity = -21;
    }
    refreshCoord();
  }
}
