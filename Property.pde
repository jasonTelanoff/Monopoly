abstract class Property extends Space {
  String name;
  int cost, monopoly, mortgageValue;
  int owner = -1;

  void show() {
    fill(255);
    stroke(0);
    rect(pos.x, pos.y, size.x, size.y);
    fill(0);
    textSize(20);
    textAlign(CENTER, CENTER);
    text("$" + cost, pos.x + size.x/2, pos.y + size.y/2);
  }
  
  boolean propertyAction() {
    if (owner == -1) {
      setConfirmBox("Would you like to buy this property?", CONFIRM_BUY);
      return true;
    }
    return false;
  }
}

String cname;
int ccost, cmon;
