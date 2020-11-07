class Player {
  PVector pos;
  int spaceNum, money, timesDoubles, num;
  Space space;
  ArrayList<Property> properties = new ArrayList<Property>();
  color col;

  Player(int num, int type) {
    this.num = num;
    switch(type) {
    case 0:
      col = color(200, 0, 0);
      break;
    case 1:
      col = color(0, 200, 0);
      break;
    case 2:
      col = color(0, 0, 200);
      break;
    }

    spaceNum = 0;
  }

  void show() {
    fill(col);
    rect(pos.x, pos.y, 50, 50);
  }
  void move() {
    pos = new PVector(space.pos.x + PROP_WIDTH/2, space.pos.y + PROP_HEIGHT/2);
  }
}
