class player {

  float x1, y1;
  player(float x, float y) {
    x1 = x;
    y1 = y;
  }
  void movePlayer(char key) {
    
    if (key == 'w' || keyCode == UP) {
      if (y1 < 160 || ob.checkCollision(key) == true ) {
      } else {
        y1 = y1 -60;
      }
    }

    if (key == 'a' || keyCode == LEFT) {
      if (x1 < 160 || ob.checkCollision(key) == true ) {
      } else {
        x1 = x1 -60;
      }
    }
    if (key == 's' || keyCode == DOWN) {
      if (y1 > 520 || ob.checkCollision(key) == true ) {
      } else {
        y1 = y1 +60;
      }
    }
    if (key == 'd' || keyCode == RIGHT) {
      if (x1 > 520 || ob.checkCollision(key) == true ) {
      } else {
        x1 = x1 +60;
      }
    }
  }

  void drawPlayer(PImage player) {
    imageMode(CENTER);
    image(player, x1+1, y1+3);
  }
}
