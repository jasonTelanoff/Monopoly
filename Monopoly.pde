PGraphics board;

Space[] spaces;

void setup() {
  size(1000, 720);
  board = createGraphics(720, 720);
  
  {
    Space[] mySpaces = {
      createEmpty(),
      createResident("Mediterranean Avenue", 60, 0, null, 0,
      new int[] {
          
      })
    };
    spaces = mySpaces;
  }
}

void draw() {
  board.beginDraw();
  board.background(0);
  
  
  
  board.endDraw();
  image(board, 0, 0);
}
