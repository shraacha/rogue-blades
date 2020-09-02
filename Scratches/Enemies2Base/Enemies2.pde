// =================================GLOBAL VARIABLES============================== //<>// //<>//
int nDx, nDy, nSide, nSide2, nMove = 0, nScreen = 0, nStartClick;
//==========================================OBJECTS==============================
Screen1 scr1;
StartingScreen scrStart;
Sprite sprHero;
//=======================================SETUP===================================
void setup () {
  size (800, 800);
  frame.requestFocus();
  scrStart = new StartingScreen();
  scr1 = new Screen1();
  sprHero = new Sprite("bill.png", width/2 - 100.0, height - 150.0, 75, 50, 0.6, 16.0, 0.8, 0, 6, 0);
}
//=======================================DRAW===================================
void draw() {
  if (nScreen == 0) {
    scrStart.update();
  } 
  if (nScreen == 1) {
    scr1.update();
  }
}
//===================================KEYPRESSED==================================
void keyPressed() {
  if (nScreen == 1) {
    scr1.pressInput();
  }
}
//===================================KEYRELEASED==================================
void keyReleased() {
  if (nScreen == 1) {
    scr1.releaseInput();
  }
}
//===================================MOUSEPRESSED==================================
void mousePressed() {
  if (mouseButton == LEFT) {
    scrStart.input();
  }
}
