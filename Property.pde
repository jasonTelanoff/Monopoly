abstract class Property extends Space {
  String name;
  int cost, monopoly;
  
  Action action;
  
  void show() {}
  void action() { if (action != null) action.apply(); }
}

interface Action { void apply(); }

String cname;
int ccost, cmon;
Action cact;
Property createProperty(String name, int cost, int monopoly, Action action) {
  cname = name;
  ccost = cost;
  cmon = monopoly;
  cact = action;
  
  return new Property() {
    {
      this.name = cname;
      this.cost = ccost;
      this.monopoly = cmon;
      this.action = cact;
    }
  };
}
