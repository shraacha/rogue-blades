class StartingScreen {
  PFont f;
  String sTitle;

  int nSBX = width/2 - 150, nSBY = height/2 - 100;
  int nIBX = width/2 - 150, nIBY = height - 250;

  Button bStartButton, bInfoButton;
  StartingScreen () {
    bStartButton = new Button ("startButton.png", nSBX, nSBY, 300, 150);
    bInfoButton = new Button ("howToPlay.png", nIBX, nIBY, 300, 150);

    f = createFont("Arial", 16, true);
    sTitle = "Rogue Blades";
  }

  public void update() {
    background(10);
    
    textFont(f, 80);    
    fill(255);
    text(sTitle, 350, 150);

    bStartButton.update();
    bInfoButton.update();

    buttonTouched();
  }
  public void buttonTouched() {
    if (bStartButton.isTouched() == true) {
      stroke(0);
      fill(255, 50);
      rect(nSBX, nSBY, 300, 150);
    } else if (bInfoButton.isTouched() == true) {
      stroke(0);
      fill(255, 50);
      rect(nIBX, nIBY, 300, 150);
    }
  }
  public void input() {
    if (bStartButton.isTouched() == true) {
      nScreen = 1;
    } else if (bInfoButton.isTouched() == true) {
      nScreen = 7;
    }
  }
}
