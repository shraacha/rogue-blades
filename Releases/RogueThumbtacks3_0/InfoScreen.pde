class InfoScreen {
  PFont f;
  String sLine1, sLine2, sLine3, sLine4, sLine5;
  
  int nBBX = width/2 - 150, nBBY = height - 200;

  Button bBackButton;
  InfoScreen () {
    bBackButton = new Button ("backButton.png", nBBX, nBBY, 300, 150);
  }
  public void update() {
    background(10);

    f = createFont("Arial", 16, true);
    sLine1 = "How to play:";
    sLine2 = "- Use 'WASD' or the directional arrow keys to move the hero and jump";
    sLine3 = "- Press 'R' to respawn the hero at the starting point";
    sLine4 = "- Get to the purple beam on the right side of each screen to get to the next level";
    sLine5 = "- Get past the fourth and last level to beat the game";
    textFont(f, 80);                
    fill(255);
    text(sLine1, 100, 100);
    textFont(f, 30);
    text(sLine2, 50, 200);
    text(sLine3, 50, 300);
    text(sLine4, 50, 400);
    text(sLine4, 50, 500);

    bBackButton.update();
    buttonTouched();
  }
  public void buttonTouched() {
    if (bBackButton.isTouched() == true) {
      stroke(0);
      fill(255, 50);
      rect(nBBX, nBBY, 300, 150);
    }
  }
  public void input() {
    if (bBackButton.isTouched() == true) {
      nScreen = 0;
    }
  }
}
