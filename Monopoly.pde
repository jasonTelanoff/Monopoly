final int PROP_WIDTH = 60, PROP_HEIGHT = 90, MONOPOLY_PURPLE = 0, MONOPOLY_LIGHT_BLUE = 1, MONOPOLY_PINK = 2;
;
int TURN = 0;
Player[] players = new Player[3];
Space[] spaces = new Space[40];
Die[] dice = new Die[2];
int[] houseCosts;

void setup() {
  size(1000, 720);

  {
    int[] myHouseCosts = new int[] {
      50, // MONOPOLY_PURPLE
      50, // MONOPOLY_LIGHT_BLUE
      100 // MONOPOLY_PINK
    };
    houseCosts = myHouseCosts;
  }

  {
    Space[] mySpaces = {
      createEmpty(), 
      createResident("Mediterranean Avenue", 60, MONOPOLY_PURPLE, new int[] { 2, 10, 30, 90, 160, 250 }), 
      createCommunity(), 
      createResident("Baltic Avenue", 60, MONOPOLY_PURPLE, new int[] { 4, 20, 60, 180, 320, 450 }), 
      createEmpty(), 
      createRailroad("Reading Railroad"), 
      createResident("Oriental Avenue", 100, MONOPOLY_LIGHT_BLUE, new int[] { 6, 30, 90, 270, 400, 550 }), 
      createChance(), 
      createResident("Vermont Avenue", 100, MONOPOLY_LIGHT_BLUE, new int[] { 6, 30, 90, 270, 400 }), 
      createResident("Connecticut Avenue", 120, MONOPOLY_LIGHT_BLUE, new int[] {8, 40, 100, 300, 450, 600 }), 
      createEmpty(), 
      createResident("ST. Charles Place", 140, MONOPOLY_PINK, new int[] { 10, 50, 150, 450, 625, 750 }), 
      createUtility("Electric Compony"), 
      createResident("States Avenue", 140, MONOPOLY_PINK, new int[] { 10, 50, 150, 450, 625, 750 }), 
      createResident("Virginia Avenue", 160, MONOPOLY_PINK, new int[] { 12, 60, 180, 500, 700, 900 }), 
    };
    for (int i = 0; i < mySpaces.length; i++)
      spaces[i] = mySpaces[i];
    for(int i = mySpaces.length; i < spaces.length; i++)
      spaces[i] = createEmpty();
  }
  for (int i = 0; i < spaces.length; i++)
    spaces[i].setPos(i);

  for (int i = 0; i < players.length; i++)
    players[i] = new Player(i);

  for (int i = 0; i < dice.length; i++)
    dice[i] = new Die();
}

void draw() {
  background(150, 195, 180);

  for (Space s : spaces)
    s.show();

  for (int i = 0; i < players.length; i++) {
    int onSpace = 0, num = 1;
    for (int ind = 0; ind < players.length; ind++) {
      if (players[ind].spaceNum == players[i].spaceNum) {
        onSpace++;
        if (ind < i)
          num++;
      }
    }
    players[i].show(onSpace, num);
  }

  for (Die d : dice)
    d.show();

  fill(172);
  noStroke();
  rect(721, 0, 281, 720);
}

void mousePressed() {
  for (Die d : dice)
    d.roll();
  players[TURN].move(dice[0].value + dice[1].value);
  if (dice[0].value != dice[1].value) {
    TURN++;
    if (TURN > players.length - 1)
      TURN = 0;
  }
}
