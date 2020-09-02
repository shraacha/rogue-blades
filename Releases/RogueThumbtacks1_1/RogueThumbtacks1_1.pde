Screen1 scr1; //<>//
StartingScreen scrStart;
int nDx, nDy, nSide, nSide2, nMove = 0, nScreen = 0, nStartClick;

void setup () {
  size (1500, 1000);
  frame.requestFocus();
  scrStart = new StartingScreen();
  scr1 = new Screen1();
}

void draw() {
  if (nScreen == 0) {
    scrStart.update();
  } 
  if (nScreen == 1) {
    scr1.update();
  }
}

void keyPressed() {
  if (nScreen == 1) {
    scr1.pressInput();
  }
}

void keyReleased() {
  if (nScreen == 1) {
    scr1.releaseInput();
  }
}
void mousePressed() {
  if (mouseButton == LEFT) {
    scrStart.input();
  }
}
