// =================================GLOBAL VARIABLES============================== //<>//
int nDx, nDy, nSide, nSide2, nMove = 0, nScreen = 0, nStartClick;
//==========================================OBJECTS==============================
Screen1 scr1;
Screen2 scr2;
StartingScreen scrStart;
Sprite sprHero;
//=======================================SETUP===================================
void setup () {
  size (1200, 800);
  frame.requestFocus();
  scrStart = new StartingScreen();
  scr1 = new Screen1();
  scr2 = new Screen2();
  sprHero = new Sprite("bill.png", 100, height - 150, 75, 50, 0.6, 16.0, 0.8, 0, 6);
}
//=======================================DRAW===================================
void draw() {
  if (nScreen == 0) {
    scrStart.update();
  } 
  if (nScreen == 1) {
    scr1.update();
  } else if (nScreen == 2) {
    scr2.update();
  }
  println(nScreen);
}
//===================================KEYPRESSED==================================
void keyPressed() {
  if (nScreen == 1) {
    scr1.pressInput();
  } else if (nScreen == 2) {
    scr2.pressInput();
  }
}
//===================================KEYRELEASED==================================
void keyReleased() {
  if (nScreen == 1) {
    scr1.releaseInput();
  } else if (nScreen == 2) {
    scr2.releaseInput();
  }
}
//===================================MOUSEPRESSED==================================
void mousePressed() {
  if (mouseButton == LEFT) {
    scrStart.input();
  }
}
