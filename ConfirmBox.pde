class ConfirmBox {
  String msg;
  int x, y, w, h;
  byte confirmed = -1, id;
  
  void setup() {
    x = (750 - w) / 2;
    y = (750 - h) / 2;
  }
  
  void show() {
    fill(0x55F5D97C);
    rect(x, y, w, h, 25);
    
    fill(#7E6D33);
    textSize(20);
    textAlign(CENTER, TOP);
    text(msg, 750 / 2, (750 - h) / 2 + 15);
    
    fill(0x88C1B077);
    stroke(#7E6D33);
    rect(x + 25, y + h - 100, 150, 50, 15);
    rect(x + w - 175, y + h - 100, 150, 50, 15);
    
    fill(#7E6D33);
    textSize(30);
    textAlign(CENTER, CENTER);
    text("Yes", x + 25 + 75, y + h - 100 + 25);
    text("No", x + w - 175 + 75, y + h - 100 + 25);
  }
  
  void onPressed() {
    if (mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h) {
      if (mouseX >= x + 25 && mouseX <= x + 25 + 150 && mouseY >= y + h - 100 && mouseY <= y + h - 100 + 50) {
        confirmed = 1;
      } else if (mouseX >= x + h - 175 && mouseX <= x + h - 175 + 150 && mouseY >= y + h - 100 && mouseY <= y + h - 100 + 50) {
        confirmed = 0;
      }
    } else
      confirmed = 0;
  }
}

String cmsg;
byte cid;
void setConfirmBox(String msg, byte id) {
  assert confirmBox == null;
  
  cmsg = msg;
  cid = id;
  
  confirmBox = new ConfirmBox() {{
    msg = cmsg;
    w = 400;
    h = 300;
    
    id = cid;
    
    setup();
  }};
}
