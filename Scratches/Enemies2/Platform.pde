class Platform {
  public int nX, nY, nDx, nDy, nH, nW;
  String sFile;
  PImage img;
  Wall wallTop, wallBot, wallLeft, wallRight;
  // ================================= CONSTRUCTOR =========================
  // Platform(String _sFile, float _fX, float _fY, int _nH, int _nW, float _fVelocity, float _fVelocityMax, float _fAccel)
  Platform( String _sFile, int _nX, int _nY, int _nW, int _nH) {
    nX = _nX;
    nY = _nY;
    nH = _nH;
    nW = _nW;
    sFile = _sFile;
    img = loadImage(sFile);
    img.resize(nW, nH);
    //sTop = createShape(RECT, nX + 10, nY, nW -20, 10);
    wallTop = new Wall("wall.png", nX, nY, nW, 10);
    wallBot = new Wall("wall.png", nX, nY+ nH -10, nW, 10);
    wallLeft = new Wall("wall.png", nX, nY, 10, nH);
    wallRight = new Wall("wall.png", nX + nW -10, nY, 10, nH);
  }
  // ================================= UPDATE =========================
  public void update(int _nDx, int _nDy) {
    nDx = _nDx;
    nDy = _nDy;
    nX +=nDx;
    nY +=nDy;
    wallTop.update(nX, nY);
    wallBot.update(nX, nY+ nH -10);
    wallLeft.update(nX, nY);
    wallRight.update(nX + nW -10, nY);
    image(img, nX, nY);
  }
  // ================================= STATIC-UPDATE ========================= 
  public void update() { // overload update just in case I don't have to change coordinates.
    nX += nDx;
    nY += nDy;
    image(img, nX, nY);
    wallTop.update();
    wallBot.update();
    wallLeft.update();
    wallRight.update();
  }  
  //============================= NHIT/COLLISION DIRECTION UP AND DOWN=============================
  public int nHitUD(Sprite s) { // 1 top, 2 bottom
    if (isHit(s, wallTop)) {
      return 1;
    } else if (isHit(s, wallBot)) {
      return 2;
    } else return 0;
  }
  //============================= NHIT/COLLISION DIRECTION LEFT & RIGHT=============================
  public int nHitLR(Sprite s) { // 3 left, 4 right
    if (isHit(s, wallLeft)) {
      return 3;
    } else if (isHit(s, wallRight)) {
      return 4;
    } else return 0;
  }
  // ============================= IS-HIT =============================
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
}
