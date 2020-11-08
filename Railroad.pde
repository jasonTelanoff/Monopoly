class Railroad extends Property {
  void action(int pid) {
    int railCount = 0;
    for (Property p : players[owner].properties) {
      if (p instanceof Railroad)
        railCount++;
    }
    
    players[pid].pay(25 * pow(2, railCount - 2));
  }
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
