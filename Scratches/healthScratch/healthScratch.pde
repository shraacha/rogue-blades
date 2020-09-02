int nHealth = 100; //<>//
void setup() {
  size(600, 600);
}
void draw() {
  background(205);
  strokeWeight(1);
  fill(255);
  rect(5, 5, 300, 50);
  noStroke();
  fill(#4CFC4D);
  rect(5, 5, nHealth * 3, 50);
}
void mousePressed() {
  if (mouseButton == LEFT) {
    nHealth -= 10;
  }
}
