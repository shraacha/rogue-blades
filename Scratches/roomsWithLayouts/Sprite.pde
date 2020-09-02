class Sprite {
  public int nX, nY, nDX, nDY, nH, nW, nG, nStartX, nStartY;  // gravity
  public boolean canJump, bCanMovePlt = true;
  String sFile;
  PImage img;
  Platform p;
  Sprite( String _sFile, int _nX, int _nY, int _nH, int _nW) {
    nX = _nX;
    nY = _nY;
    nH = _nH;
    nW = _nW;
    nG = 1;
    sFile = _sFile;
    img = loadImage(sFile);
    img.resize(nW, nH);
    canJump = true;
  }
  public void setDx(int _nDX) {
    nDX = _nDX;
  }
  public void setDy(int _nDY) {
    nDY = _nDY;
  }
  public void update() {
    nG = 1;
    //nDX = _nDX;
    //nDY = _nDY;
    nStartX = nX;
    nStartY = nY;
    nDY += nG;
    nX += nDX;
    nY += nDY;
    image(img, nX, nY);
    if (nY + img.height > height) {
      nY = height - img.height;
      canJump = true;
      nDY = 0;
    }
  }
  public void backUp() {
    nX = nStartX;
    nY = nStartY;
  }
  public void backUpXLeft() {
  }
  public void backUpXRight() {
  }
  public void backUpY(Platform _p) {
    p = _p;
    nY = p.nY - nH - 2;
    nDY = 0;
    canJump = true;
  }
  public void bumpHead() {
    nDY = 0;
    nY += 3;
  }
}
