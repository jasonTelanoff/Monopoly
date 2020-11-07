final int PROP_WIDTH = 60, PROP_HEIGHT = 90;
int TURN = 0;
Player[] players = new Player[3];
Space[] spaces;
Die[] dice = new Die[2];

void setup() {
  size(1000, 720);

  {
    Space[] mySpaces = {
      createEmpty(), 
      createResident("Mediterranean Avenue", 60, 0, 0, null, 0, new int[] {}), 
      createEmpty(), 
      createEmpty(), 
      createEmpty(), 
      createEmpty(), 
      createEmpty(), 
      createEmpty(), 
      createEmpty(), 
      createEmpty(), 
      createEmpty(), 
      createEmpty(), 
      createEmpty(), 
      createEmpty(), 
      createEmpty(), 
      createEmpty(), 
      createEmpty(), 
      createEmpty(), 
      createEmpty(), 
      createEmpty(), 
      createEmpty(), 
      createEmpty(), 
      createEmpty(), 
      createEmpty(), 
      createEmpty(), 
      createEmpty(), 
      createEmpty(), 
      createEmpty(), 
      createEmpty(), 
      createEmpty(), 
      createEmpty(), 
      createEmpty(), 
      createEmpty(), 
      createEmpty(), 
      createEmpty(), 
      createEmpty(), 
      createEmpty(), 
      createEmpty(), 
      createEmpty(), 
      createEmpty(), 
    };
    spaces = mySpaces;
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
        if(ind < i)
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
