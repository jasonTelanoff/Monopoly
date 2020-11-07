abstract class Property extends Space {
  String name;
  int cost, monopoly, mortgageValue;

  void show() {
    fill(255);
    stroke(0);
    rect(pos.x, pos.y, size.x, size.y);
  }
}

interface Action { 
  void apply();
}

String cname;
int ccost, cmon;
