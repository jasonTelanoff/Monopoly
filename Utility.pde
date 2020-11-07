class Utility extends Property {
  void action() {}
}

Utility createUtility(String name) {
  cname = name;
  
  return new Utility() {
    {
      this.name = cname;
      this.cost = 150;
      this.monopoly = -1;
      this.mortgageValue = 75;
    }
  };
}
