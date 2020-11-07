class Die {
  PVector pos;
  float rotation;
  int value;
  
  {
    roll();
  }
  
  void show() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(rotation);
    fill(255);
    stroke(0);
    rect(0, 0, 40, 40);
    fill(0);
    textSize(30);
    textAlign(CENTER, CENTER);
    text(value, 20, 20);
    popMatrix();
  }
  
  void roll() {
    value = 1 + (int) random(6);
    pos = new PVector(random(300, 420), random(300, 420));
    rotation = random(TWO_PI);
  }
}
