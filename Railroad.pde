class Railroad extends Property {
  void action() {}
}

Railroad createRailroad(String name) {
  cname = name;
  
  return new Railroad() {
    {
      this.name = cname;
      this.cost = 200;
      this.monopoly = -1;
      this.mortgageValue = 100;
    }
  };
}
