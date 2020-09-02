Screen1 scr1;
SpriteBill sprBill;
SpriteEn sprEn;
int nDx, nDy, nSide, nSide2, nMove = 0, nScreen = 0, nStartClick;

void setup () {
  size (1500, 1000);
  scr1 = new Screen1();
  sprBill=new SpriteBill("bill.png", width/2 - 100, height - 150, 150, 100);
  sprEn=new SpriteEn("gooStache.png", width-300, height-150, 200, 150);
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
