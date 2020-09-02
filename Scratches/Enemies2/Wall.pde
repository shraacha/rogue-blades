class Wall {

  public int nX, nY, nDx, nDy, nH, nW;
  String sFile;
  PImage img;
  Sprite sprTop, sprBot, sprLeft, sprRight;
  Wall(String _sFile, int _nX, int _nY, int _nW, int _nH) {
    nX = _nX;
    nY = _nY;
    nH = _nH;
    nW = _nW;
    sFile = _sFile;
    img = loadImage(sFile);
    img.resize(nW, nH);
  }
  public void update(int _nX, int _nY) {
    //nDx = _nDx;
    //nDy = _nDy;
    nX = _nX;
    nY = _nY;
    image(img, nX, nY);
  }
  // overload update just in case I don't have to change coordinates.
  public void update() {
    nX +=nDx;
    nY +=nDy;
    image(img, nX, nY);
  }
}
