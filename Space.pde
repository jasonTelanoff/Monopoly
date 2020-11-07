interface SpaceActions { 
  void show(); 
  void action();
}

abstract class Space implements SpaceActions {
  PVector pos = new PVector(0, 0), size = new PVector(0, 0);
  int i;

  void setPos(int i) {
    this.i = i;
    if (i < 10) {
      pos.y = 720 - PROP_HEIGHT;
      pos.x = 720 - PROP_HEIGHT - i * PROP_WIDTH;
      size.x = i == 0 ? PROP_HEIGHT : PROP_WIDTH;
      size.y = PROP_HEIGHT;
    } else if (i < 20) {
      pos.x = 0;
      pos.y = 720 - PROP_HEIGHT - (i - 10) * PROP_WIDTH;
      size.x = PROP_HEIGHT;
      size.y = i == 10 ? PROP_HEIGHT : PROP_WIDTH;
    } else if (i < 30) {
      pos.y = 0;
      pos.x = i == 20 ? 0 : PROP_HEIGHT + (i - 21) * PROP_WIDTH;
      size.x = i == 20 ? PROP_HEIGHT : PROP_WIDTH;
      size.y = PROP_HEIGHT;
    } else {
      pos.x = 720 - PROP_HEIGHT;
      pos.y = i == 30 ? 0 : PROP_HEIGHT + (i - 31) * PROP_WIDTH;
      size.x = PROP_HEIGHT;
      size.y = i == 30 ? PROP_HEIGHT : PROP_WIDTH;
    }
  }
}

Space createEmpty() {
  return new Space() { 
    public void show() {
      fill(255);
      stroke(0);
      rect(pos.x, pos.y, size.x, size.y);
    } 
    public void action() {
    }
  };
}
