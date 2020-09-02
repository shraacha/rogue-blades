class Button {
  public int nX, nY, nDx, nDy, nW, nH;
  String sFile;
  PImage img;
  Button( String _sFile, int _nX, int _nY, int _nW, int _nH) {
    nX = _nX;
    nY = _nY;
    nW = _nW;
    nH = _nH;
    sFile = _sFile;
    img = loadImage(sFile);
    img.resize(nW, nH);
  }

  public void update() {
    image(img, nX, nY);
  }
  public boolean isTouched() {
    if (mouseX >=nX && mouseX <= nX+img.width && mouseY >=nY && mouseY<= nY+img.height) {
      return true;
    } else {
      return false;
    }
  }
}
