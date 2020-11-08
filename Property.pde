abstract class Property extends Space {
  String name;
  int cost, monopoly, mortgageValue;
  int owner = -1;

  void show() {
    fill(255);
    stroke(0);
    rect(pos.x, pos.y, size.x, size.y);
  }
}

String cname;
int ccost, cmon;
