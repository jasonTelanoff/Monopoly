class Utility extends Property {
  void action(int pid) {
    if (propertyAction())
      return;
      
    int utCount = 0;
    for (Property p : players[owner].properties) {
      if (p instanceof Utility)
        utCount++;
    }

    for (Die d : dice) {
      players[pid].pay(d.value * (utCount == 1 ? 4 : 10), owner);
    }
  }
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
