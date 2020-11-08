class Resident extends Property {
  int numHouses;
  int[] rentCosts;
  color col;

  void show() {
    fill(255);
    stroke(0);
    rect(pos.x, pos.y, size.x, size.y);
    fill(col);
    if (i < 10)
      rect(pos.x, pos.y, size.x, size.y*.15);
    else if (i < 20)
      rect(pos.x + 0.85*size.x, pos.y, size.x*.15, size.y);
    else if (i < 30)
      rect(pos.x, pos.y + 0.85*size.y, size.x, size.y*.15);
    else
      rect(pos.x, pos.y, size.x*.15, size.y);
  }

  void action(int pid) {
    players[pid].pay(rentCosts[numHouses]);
  }
}

int[] crentCosts;
Resident createResident(String name, int cost, int monopoly, int[] rentCosts) {
  cname = name;
  ccost = cost;
  cmon = monopoly;
  crentCosts = java.util.Arrays.copyOfRange(rentCosts, 0, rentCosts.length);
  final color _col;

  switch(cmon) {
  case 0:
    _col = color(170, 20, 200);
    break;
  case 1:
    _col = color(60, 210, 240);
    break;
  case 2:
    _col = color(230, 60, 240);
    break;
  case 3:
    _col = color(240, 170, 60);
    break;
  case 4:
    _col = color(250, 50, 0);
    break;
  case 5:
    _col = color(240, 250, 0);
    break;
  case 6:
    _col = color(20, 180, 20);
    break;
  case 7:
    _col = color(20, 20, 200);
    break;
  default:
    _col = color(0);
    break;
  }

  return new Resident() {
    {
      this.name = cname;
      this.cost = ccost;
      this.monopoly = cmon;
      this.mortgageValue = ccost / 2;
      this.col = _col;
      this.rentCosts = crentCosts;
    }
  };
}
