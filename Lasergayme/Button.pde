class button {

  float buttonX, buttonY, buttonW, buttonH;
  String text;
  boolean pressed = false;
  boolean clicked = false;
  button(float x, float y, float w, float h, String t) {
    buttonX = x;
    buttonY = y;
    buttonW = w;
    buttonH = h;
    text = t;
  }


  void render() {
    rect(buttonX, buttonY, buttonW, buttonH);
    fill(0, 0, 0);
    text(text, buttonX, buttonY+10);
    noFill();
  }

  void update() {
    if (mousePressed == true && mouseButton == LEFT && pressed == false) {
      pressed = true;
      if (mouseX >= buttonX - buttonW/2 && mouseX <= buttonX + buttonW/2 && mouseY >= buttonY - buttonH/2 && mouseY <= buttonY + buttonH/2) {
        clicked = true;
      }
    } else {
      clicked = false;
    }
    if (mousePressed != true) {
      pressed = false;
    }
  }

  boolean isClicked() {
    return clicked;
  }
}
