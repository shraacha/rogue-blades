class Screen {
  String sFile;
  PImage img;
  Screen (String _sFile) {
    sFile = _sFile;
    img = loadImage (sFile);
    img.resize (width, height);
  }
  public void update() {
    background(255);
    image(img, 0, 0);
  }
}
