abstract class Resident extends Property {
  int numHouses;
  int[] rentCosts;
}

int cnumHouses;
int[] crentCosts;
Resident createResident(String name, int cost, int monopoly, int mortgageValue, Action action, int numHouses, int[] rentCosts) {
  cname = name;
  ccost = cost;
  cmon = monopoly;
  cact = action;
  cmortVal = mortgageValue;

  cnumHouses = numHouses;
  crentCosts = java.util.Arrays.copyOfRange(rentCosts, 0, rentCosts.length);

  return new Resident() {
    {
      this.name = cname;
      this.cost = ccost;
      this.monopoly = cmon;
      this.action = cact;
      this.mortgageValue = cmortVal;

      this.numHouses = cnumHouses;
      this.rentCosts = crentCosts;
    }
  };
}
