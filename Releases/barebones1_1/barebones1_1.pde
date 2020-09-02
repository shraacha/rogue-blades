Screen1 scr1; //<>//
int nDx, nDy, nSide, nSide2, nMove = 0, nScreen = 0, nStartClick;

void setup () {
  size (1500, 1000);
  scr1 = new Screen1();
}

void draw() {
    scr1.update();
}

void keyPressed() {
    scr1.pressInput();
}

void keyReleased() {
    scr1.releaseInput();
}
void mousePressed() {
}
