class Sprite {
  public int nX, nY, nDx, nDy, nH, nW, nG, nStartX, nStartY;  // gravity
  public boolean canJump;
  String sFile;
  PImage img;
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
  public void setDx(int _nDx) {
    nDx = _nDx;
  }
  public void setDy(int _nDy) {
    nDy = _nDy;
  }
  // overload update just in case I don't have to change coordinates.
  public void update() {
    nStartX = nX;
    nStartY = nY;
    nDy += nG;
    nX +=nDx;
    nY +=nDy;
    image(img, nX, nY);
    if (nY +img.height > height) { // check if it hits the ground.
      nY = height - img.height;
      canJump = true;
      nDy = 0;
    }
  }
  public void backUp() {
    nX = nStartX;
    nY = nStartY;
  }
  public void backUpX() {
    nX = nStartX;
  }
  public void backUpY() {
    nY = nStartY;
    nDy = 0;
    canJump = true;
  }
  public void bumpHead() {
    nDy = 0;
    nY+=3;
  }
} 
