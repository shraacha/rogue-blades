class Bg {
  String sFile;
  PImage imgBG1, imgBG2;
  int nW, nH, nX1, nX2, nY1, nY2;
  float fDx;
  Bg(String _sFile, int _nW, int _nH) {
    sFile = _sFile;
    nW = _nW;
    nH = _nH;
    imgBG1 = loadImage(sFile);
    imgBG2 = loadImage(sFile);
    imgBG1.resize(nW, nH);
    imgBG2.resize(nW, nH);
    nX2 = nW;
  }
  void update(float _fDx) {
    fDx = _fDx;
    nX1+=fDx;
    nX2+=fDx;
    image (imgBG1, nX1, nY1);
    image (imgBG2, nX2, nY2);
    if (nX1 < -nW) {
      nX1 = nX2 + nW; //move background to the far right
    } else if (nX2 < -nW) {
      nX2 = nX1 + nW; //move background to the far right
    }
    if (nX2 > nW) {
      nX2 = nX1 - nW; //move background to the far left
    } else if (nX1 > nW) {
      nX1 = nX2 - nW; //move background to the far left
    }
  }
}
