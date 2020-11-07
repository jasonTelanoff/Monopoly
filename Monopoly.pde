final int PROP_WIDTH = 65, PROP_HEIGHT = 100;
Player[] players = new Player[1];
Space[] spaces;

void setup() {
  size(1000, 720);

  {
    Space[] mySpaces = {
      createEmpty(), 
      createResident("Mediterranean Avenue", 60, 0, 0, null, 0, new int[] {})
    };
    spaces = mySpaces;
  }
  for(int i = 0; i < spaces.length; i++)
    spaces[i].setPos(i);

  players[0] = new Player(0);
}

void draw() {
  background(0);

  for (Player p : players)
    p.show();
}
