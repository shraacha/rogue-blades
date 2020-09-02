// =================================GLOBAL VARIABLES============================== //<>//
int nDx, nDy, nSide, nSide2, nMove = 0, nScreen = 0, nStartClick;
int nBoxSize = 100;
//==========================================OBJECTS==============================
Screen1 scr1;
ScreenStart scrStart;
Sprite sprHero;
Sprite sPlat;
//=======================================SETUP===================================
void setup () {
  size (1000, 1000);
  frame.requestFocus();

  scrStart = new ScreenStart();
  scr1 = new Screen1();
  sprHero = new Sprite("bill.png", width/2 - 100.0, height - 150.0, 150, 100, 0.6, 16.0, 1.6, 1, 6);
  //sPlat = new Sprite("plank.png", 500, 500, 100, 100, 0.0, 0.0, 0.0, 0, 0);
}
//=======================================DRAW===================================
void draw() {
  if (nScreen == 0) {
    scrStart.update();
  } else if (nScreen == 1) {
    scr1.update();
  }
}
//===================================KEYPRESSED==================================
void keyPressed() {
  if (nScreen == 1) {
    //scr1.pressInput();
    if (key == 'w' || key == 'W'||keyCode==UP) {
      sprHero.jump();
      sprHero.canJump = false;
    }
    if (key == 'd' || key == 'D'||keyCode==RIGHT) {
      sprHero.nDirec = 1; //right
    }
    if (key == 'a' || key == 'A'||keyCode==LEFT) {
      sprHero.nDirec = 2; //left
    }
  }
}
//===================================KEYRELEASED==================================
void keyReleased() {
  if (nScreen == 1) {
    if ((key=='d'||key=='D')||(key=='a'||key=='A')||keyCode==RIGHT||keyCode==LEFT) {
      sprHero.nDirec = 0;
    }
  }
}
//===================================MOUSEPRESSED==================================
void mousePressed() {
  if (nScreen == 0) {
    if (mouseButton == LEFT ) {
      scrStart.input();
    }
  }
}
