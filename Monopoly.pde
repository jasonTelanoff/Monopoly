PGraphics board;

void setup() {
  size(1000, 720);
  board = createGraphics(720, 720);
}

void draw() {
  board.beginDraw();
  board.background(0);
  
  
  
  board.endDraw();
  image(board, 0, 0);
}
