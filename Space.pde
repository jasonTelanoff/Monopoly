interface SpaceActions { 
  void show(); 
  void action();
}

abstract class Space implements SpaceActions {
  PVector pos = new PVector(0, 0);

  void setPos(int i) {
    if (i < 9) {
      pos.y = 720 - PROP_HEIGHT;
      pos.x = 720 - PROP_HEIGHT - i * PROP_WIDTH;
    } else if (i < 19) {
      pos.x = 0;
      pos.y = 720 - PROP_HEIGHT - i * PROP_WIDTH;
    } else if (i < 29) {
      pos.y = 0;
      pos.x = PROP_HEIGHT + i * PROP_WIDTH;
    } else {
      pos.y = 720 - PROP_HEIGHT;
      pos.x = PROP_HEIGHT + i * PROP_WIDTH;
    }
  }
}

Space createEmpty() {
  return new Space() { 
    public void show() {
    } 
    public void action() {
    }
  };
}
