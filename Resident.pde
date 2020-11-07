abstract class Resident extends Property {
  int numHouses;
  int[] rentCosts;
  
  void action() {}
}

int[] crentCosts;
Resident createResident(String name, int cost, int monopoly, int[] rentCosts) {
  cname = name;
  ccost = cost;
  cmon = monopoly;
  crentCosts = java.util.Arrays.copyOfRange(rentCosts, 0, rentCosts.length);

  return new Resident() {
    {
      this.name = cname;
      this.cost = ccost;
      this.monopoly = cmon;
      this.mortgageValue = ccost / 2;
      
      this.rentCosts = crentCosts;
    }
  };
}
