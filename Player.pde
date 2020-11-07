class Player {
  PVector pos = new PVector(0, 0);
  int spaceNum, money, timesDoubles;
  Space space;
  ArrayList<Property> properties = new ArrayList<Property>();
  color col;

  Player(int type) {
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
    space = spaces[spaceNum];
    pos = new PVector(space.pos.x + space.size.x/2, space.pos.y + space.size.y/2);
  }

  void show() {
    fill(col);
    circle(pos.x, pos.y, 50);
  }
  void move() {
    spaceNum++;
    if(spaceNum == 40)
      spaceNum = 0;
    space = spaces[spaceNum];
    pos = new PVector(space.pos.x + space.size.x/2, space.pos.y + space.size.y/2);
  }
}
