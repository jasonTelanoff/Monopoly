final int NUM_PLAYERS = 3, PROP_WIDTH = 60, PROP_HEIGHT = 90, MONOPOLY_PURPLE = 0, MONOPOLY_LIGHT_BLUE = 1, MONOPOLY_PINK = 2;
final byte CONFIRM_BUY = 0;
int TURN = 0;
Player[] players = new Player[NUM_PLAYERS];
Space[] spaces;
Die[] dice = new Die[2];
int[] houseCosts;
ConfirmBox confirmBox;

final int numSpaces = 40;

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

  loadFile("data/map.txt");

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

  fill(122);
  noStroke();
  rect(721, 0, 281, 720);

  showInfo(players[TURN]);

  if (confirmBox != null)
    confirmBox.show();
}

void showInfo(Player p) {
  fill(255);
  textSize(50);
  textAlign(LEFT, TOP);
  text("Player " + TURN, 730, 10);
  text("$" + p.money, 730, 60);

  for (Property prop : p.properties) {
  }
}

void mousePressed() {
  if (!(confirmBox == null)) {
    confirmBox.onPressed();
    if (confirmBox.confirmed != -1) {
      confirmEvent(boolean(confirmBox.confirmed));
      confirmBox = null;
    }
    return;
  }

  for (Die d : dice)
    d.roll();
  players[TURN].move(dice[0].value + dice[1].value);
  if (dice[0].value != dice[1].value) {
    TURN++;
    if (TURN > players.length - 1)
      TURN = 0;
  }
}

void confirmEvent(boolean confirmed) {
  if (!confirmed)
    return;
  switch (confirmBox.id)
  {
  case CONFIRM_BUY:
    int pid;
    if (TURN - 1 < 0)
      pid = NUM_PLAYERS - (TURN - 1);
    else
      pid = TURN - 1;
    
    players[pid].buyProperty();
    break;
  }
}
