class Player {
  int index;
  PVector pos = new PVector(0, 0);
  int spaceNum, money = 1500, timesDoubles;
  Space space;
  ArrayList<Property> properties = new ArrayList<Property>();
  color col;

  Player(int type) {
    switch(index = type) {
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

  void show(int onSpace, int num) {
    fill(col);
    noStroke();
    
    pushMatrix();
    translate(pos.x, pos.y);
    if(onSpace > 1) {
      rotate(map(num, 0, onSpace, 0, TWO_PI));
      circle(PROP_WIDTH/5, 0, 30);
    } else circle(0, 0, 30);
    popMatrix();
  }
  void move(int move) {
    spaceNum+= move;
    if(spaceNum >= 40)
      spaceNum-= 40;
    space = spaces[spaceNum];
    pos = new PVector(space.pos.x + space.size.x/2, space.pos.y + space.size.y/2);
    space.action(index);
  }
  void pay(float amt) {
    money += amt;
  }
}
