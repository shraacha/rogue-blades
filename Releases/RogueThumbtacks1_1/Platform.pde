class Platform {
  public int nX, nY, nDx, nDy, nH, nW;
  String sFile;
  PImage img;
  Wall wallTop, wallBot, wallLeft, wallRight;
  Platform( String _sFile, int _nX, int _nY, int _nH, int _nW) {
    nX = _nX;
    nY = _nY;
    nH = _nH;
    nW = _nW;
    sFile = _sFile;
    img = loadImage(sFile);
    img.resize(nW, nH);
    //sTop = createShape(RECT, nX + 10, nY, nW -20, 10);
    wallTop = new Wall("wall.png", nX+10, nY, 10, nW-20);
    wallBot = new Wall("wall.png", nX+10, nY+ nH -10, 10, nW-20);
    wallLeft = new Wall("wall.png", nX, nY, nH, 10);
    wallRight = new Wall("wall.png", nX + nW -10, nY, nH, 10);
  }
  public void update(int _nDx, int _nDy) {
    nDx = _nDx;
    nDy = _nDy;
    nX +=nDx;
    nY +=nDy;
    wallTop.update(nDx, nDy);
    wallBot.update(nDx, nDy);
    wallLeft.update(nDx, nDy);
    wallRight.update(nDx, nDy);
    image(img, nX, nY);
  }
  // overload update just in case I don't have to change coordinates.
  public void update() {
    nX +=nDx;
    nY +=nDy;
    image(img, nX, nY);
    wallTop.update();
    wallBot.update();
    wallLeft.update();
    wallRight.update();
  }  
  public int nHit(Sprite s) { // 1 top, 2 bottom, 3 left, 4 right
    if (isHit(s, wallTop)) {
      return 1;
    } else if (isHit(s, wallBot)) {
      return 2;
    } else if (isHit(s, wallLeft)) {
      return 3;
    } else if (isHit(s, wallRight)) {
      return 4;
    } else return 0;
  }

  boolean isHit(Sprite one, Wall two) {
    float fX1, fY1, fX2, fY2;
    int nH1, nW1, nH2, nW2;
    fX1 = one.nX;
    fY1 = one.nY; 
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
