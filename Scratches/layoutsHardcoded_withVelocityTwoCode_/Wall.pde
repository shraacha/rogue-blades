class Wall {
  public int nX, nY, nDx, nDy, nH, nW;
  String sFile;
  PImage img;
  Sprite sprTop, sprBot, sprLeft, sprRight;

  //============================== CONSTRUCTOR ==============================
  Wall( String _sFile, int _nX, int _nY, int _nW, int _nH) {
    nX = _nX;
    nY = _nY;
    nH = _nH;
    nW = _nW;
    sFile = _sFile;
    img = loadImage(sFile);
    img.resize(nW, nH);
  }
  //============================== UPDATE ==============================
  public void update(int _nDx, int _nDy) {
    nDx = _nDx;
    nDy = _nDy;
    nX += nDx;
    nY += nDy;
    image(img, nX, nY);
  }
  //============================== UPDATE ==============================
  // overload update just in case I don't have to change coordinates.
  public void update() {
    nX +=nDx;
    nY +=nDy;
    image(img, nX, nY);
  }
  //============================== IS-HIT ==============================
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
