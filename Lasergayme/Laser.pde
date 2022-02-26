class laser { // laser classe
  boolean shoot = false; // shoot sættes til false
  float random; // random bliver lavet
  int startTime1 = millis(); // vi sætter starttiden
  laser() { // laser objektet
  }
  void drawLaser(float posx, float posy, float chance, PImage L0, PImage L1, PImage L2, PImage L3, PImage L4, PImage L5, boolean up, PImage laser, int chargeTime) { // laser tegner
    if (shoot == false) { // hvis shoot er false
      random = int(random(0, chance)); // vælg et random tal mellem 0 og chance
      startTime1 = millis(); // start timer
    }
    imageMode(CENTER);
    rectMode(CENTER);
    image(L0, posx, posy);
    if (random == 50) {
      shoot = true;
      laserShoot(posx, posy, L1, L2, L3, L4, L5, laser, up, chargeTime);
    }
  }

  void laserShoot(float x, float y, PImage L1, PImage L2, PImage L3, PImage L4, PImage L5, PImage laser, boolean up, int chargeTimer) {
    int currentTime1 = millis() - startTime1;
    int percentage = (currentTime1*100)/chargeTimer;
    println(percentage);
      if(percentage >= 0 && percentage < 20){
        println("1");
        image(L1, x, y);
      } else if(percentage >= 20 && percentage < 40){
        println("2");
        image(L2, x, y);
      } else if(percentage >= 40 && percentage < 60){
        println("3");
        image(L3, x, y);
      } else if(percentage >= 60 && percentage < 80){
        println("4");
        image(L4, x, y);
      } else if(percentage >= 80 && percentage < 150){
        println("5");
        image(L5, x, y);
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
       
      } else if(percentage >= 150){
      shoot = false;
      startTime1 = millis(); 
      }
     
    
  /*  if (currentTime1 < chargeTimer) {
     // image(L1, x, y);
    } else if (currentTime1 >= chargeTimer && currentTime1 <= chargeTimer+1000) {
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
    noFill();*/
  }
}
