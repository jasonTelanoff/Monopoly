abstract class Resident extends Property {
    int numHouses;
    int[] rentCosts;
}

int cnumHouses;
int[] crentCosts;
Resident createResident(String name, int cost, int monopoly, Action action, int numHouses, int[] rentCosts) {
  cname = name;
  ccost = cost;
  cmon = monopoly;
  cact = action;
  
  cnumHouses = numHouses;
  crentCosts = java.util.Arrays.copyOfRange(rentCosts, 0, rentCosts.length);
  
  return new Resident() {
    {
      this.name = cname;
      this.cost = ccost;
      this.monopoly = cmon;
      this.action = cact;
      
      this.numHouses = cnumHouses;
      this.rentCosts = crentCosts;
    }
  };
}
