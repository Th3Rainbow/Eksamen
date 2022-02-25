class player {

  float x1, y1;
  player(float x, float y) {
    x1 = x;
    y1 = y;
  }
  void movePlayer(char key) {
    if (key == 'w') {
      if (y1 < 160 || ob.checkCollision(key) == true ) {
      } else {
        y1 = y1 -60;
      }
    }

    if (key == 'a') {
      if (x1 < 160 || ob.checkCollision(key) == true ) {
      } else {
        x1 = x1 -60;
      }
    }
    if (key == 's') {
      if (y1 > 520 || ob.checkCollision(key) == true ) {
      } else {
        y1 = y1 +60;
      }
    }
    if (key == 'd') {
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
