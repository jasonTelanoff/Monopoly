final int PROP_WIDTH = 60, PROP_HEIGHT = 90;
Player[] players = new Player[1];
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
  for(int i = 0; i < spaces.length; i++)
    spaces[i].setPos(i);

  players[0] = new Player(0);
  
  for(int i = 0; i < dice.length; i++)
    dice[i] = new Die();
}

void draw() {
  background(150, 195, 180);
  
  for (Space s : spaces)
    s.show();
  
  for (Player p : players)
    p.show();
    
  for(Die d : dice)
    d.show();
  
  fill(172);
  noStroke();
  rect(721, 0, 281, 720);
}

void mousePressed() {
  for(Die d : dice)
    d.roll();
  players[0].move(dice[0].value + dice[1].value);
}
