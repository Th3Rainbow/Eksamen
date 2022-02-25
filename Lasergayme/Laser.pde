class laser { // laser classe
  boolean shoot = false; // shoot sættes til false
  float random; // random bliver lavet
  int startTime1 = millis(); // vi sætter starttiden
  laser() { // laser objektet
  }
  void drawLaser(float posx, float posy, float chance, PImage L0, PImage L1, PImage L2, boolean up, PImage laser, int chargeTime) { // laser tegner
    if (shoot == false) { // hvis shoot er false
      random = int(random(0, chance)); // vælg et random tal mellem 0 og chance
      startTime1 = millis(); // start timer
    }
    imageMode(CENTER);
    rectMode(CENTER);
    image(L0, posx, posy);
    if (random == 50) {
      shoot = true;
      // println("charge");
      laserShoot(posx, posy, L1, L2, laser, up, chargeTime);
    }
  }

  void laserShoot(float x, float y, PImage L1, PImage L2, PImage laser, boolean up, int chargeTimer) {
    int currentTime1 = millis() - startTime1;
    if (currentTime1 < chargeTimer) {
      // fill(255, 0, 0);
      image(L1, x, y);
    } else if (currentTime1 >= chargeTimer && currentTime1 <= chargeTimer+1000) {
      //fill(255, 0, 0);
      if (up == true) {
        if (a.x1 == x) {
          dead = true;
        }
        image(laser, x, 350);
      } else {
        image(laser, 330, y);
        if (a.y1 == y) {
          dead = true;
        }
      }
      image(L2, x, y);
    } else if (currentTime1 > 3000) {
      shoot = false;
      startTime1 = millis();
    }
    noFill();
  }
}
