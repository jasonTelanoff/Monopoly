interface SpaceActions { 
  void show(); 
  void action();
}

abstract class Space implements SpaceActions {
  PVector pos;
}

Space createEmpty() {
  return new Space() { 
    public void show() {
    } 
    public void action() {
    }
  };
}
