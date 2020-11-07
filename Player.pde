class Player {
  PVector pos = new PVector(0, 0);
  int spaceNum, money, timesDoubles;
  Space space;
  ArrayList<Property> properties = new ArrayList<Property>();
  color col;

  Player(int type) {
    switch(type) {
    case 0:
      col = color(230, 0, 0);
      break;
    case 1:
      col = color(0, 230, 0);
      break;
    case 2:
      col = color(0, 0, 230);
      break;
    }

    spaceNum = 0;
    space = spaces[spaceNum];
    pos = new PVector(space.pos.x + space.size.x/2, space.pos.y + space.size.y/2);
  }

  void show() {
    fill(col);
    noStroke();
    circle(pos.x, pos.y, 30);
  }
  void move(int move) {
    spaceNum+= move;
    if(spaceNum >= 40)
      spaceNum-= 40;
    space = spaces[spaceNum];
    pos = new PVector(space.pos.x + space.size.x/2, space.pos.y + space.size.y/2);
  }
}
