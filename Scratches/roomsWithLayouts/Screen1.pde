class Screen1 {
  Sprite sprBill;
  Platform pPlat;
  String sFile;
  PImage imgBG1, imgBG2;
  public int nW = width, nH, nX1, nX2, nY1, nY2, nCols = 10, nRows = 10, nReact;
  float fDx, fDy;
  ArrayList<Platform> alPlatforms = new ArrayList<Platform>();
  int[][] nLayout = { {1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, 
                      {1, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
                      {1, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
                      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
                      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
                      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
                      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
                      {1, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
                      {1, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
                      {1, 1, 1, 1, 1, 1, 1, 1, 1, 1}  };

  Screen1() {
    imgBG1 = loadImage("background.jpg");
    imgBG2 = loadImage("background.jpg");
    imgBG1.resize(1000, 1000);
    imgBG2.resize(1000, 1000);
    nX2 = nW;
    sprBill = new Sprite("bill.png", width/2 - 100, height - 150, 150, 100);
    for (int i = 0; i < nCols; i++) {
      for (int j = 0; j < nRows; j++) {
        if (nLayout[i][j] == 1) {
          pPlat = new Platform ("plank.png", i * 100, j * 100, 100 , 100);
          alPlatforms.add(pPlat);
        }
      }
    }
  }
  
  void update() {
    nX1 += fDx;
    nX2 += fDx;
    image (imgBG1, nX1, nY1);
    image (imgBG2, nX2, nY2);
    for (int j = 0; j<alPlatforms.size(); j++) {
      Platform pPlat= (Platform)alPlatforms.get(j);
      pPlat.update(sprBill);
    }
    //sprBill.update(-int(fDx), int(fDy));
    sprBill.update();
  }
  
  public void pressInput() {
    if (key == 'd' && pPlat.nSide != 3 ) {
      sprBill.setDx(4);
      pPlat.nDir = 1;
    } else if (key == 'a' && pPlat.nSide != 4) {
      sprBill.setDx(-4);
      pPlat.nDir = 2;
    } else if (key == 'w' && sprBill.canJump == true) {
      sprBill.setDy(-30);
      sprBill.canJump = false;
      nDir = 3;
    } else {
      sprBill.setDx(0);
      pPlat.nDir = 0;
    }
  }
  
  public void releaseInput() {
    if (key == 'd') {
      sprBill.setDx(0);
    } else if (key == 'a') {
      sprBill.setDx(0);
    } else {
      sprBill.setDx(0);
    }
  }
}
