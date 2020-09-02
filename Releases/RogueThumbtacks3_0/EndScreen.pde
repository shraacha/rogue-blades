class EndScreen {
  PFont f;
  String sLine1, sLine2, sLine3, sLine4;
  
  int nMBX = width/2 - 150, nMBY = height - 300;

  Button bMenu;
  EndScreen () {
    bMenu = new Button ("menu.png", nMBX, nMBY, 300, 150);
  }
  public void update() {
    background(10);

    f = createFont("Arial", 16, true);
    sLine1 = "You Beat The Game!";
    sLine2 = "Thank's for playing!";
    sLine3 = "Press the MENU button to go back to the starting screen";

    textFont(f, 80);                
    fill(255);
    text(sLine1, 200, 100);
    textFont(f, 40);
    text(sLine2, 100, 200);
    text(sLine3, 100, 300);

    bMenu.update();
    buttonTouched();
  }
  public void buttonTouched() {
    if (bMenu.isTouched() == true) {
      stroke(0);
      fill(255, 50);
      rect(nMBX, nMBY, 300, 150);
    }
  }
  public void input() {
    if (bMenu.isTouched() == true) {
      nScreen = 0;
    }
  }
}
