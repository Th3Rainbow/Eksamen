button playButton; // buttons
button levelsButton;

button level1;
button level2;
button level3;
button level4;
button level5;

button back;

button retry;
button main;

button next;

obstacle ob; // obstacle object

int pX1 = 130; //Player x1
int pY1 = 130; // Player y1
int chance = 2000; // chance for each laser to shoot each frame

int currentLvl = 1; // current level
int highestLvl =5; // highest lvl reached
int chargeTime = 2000; // time for laser to charge
int selectedLvl = 1; // selected lvl

int levelTime; // how long the level is
int startTime; // used for timing

int highscore1;
int highscore2;
int highscore3;
int highscore4;
int highscore5;

int obstacleTime; // The time between obstacles spawn

boolean takeScore = true;
boolean completed; 

boolean obstacle = false; // if the current level has obstacles
boolean shoot = false; // if laser shoots
boolean up = false; // if laser points up
boolean clickable = true; // if a button should be clickable

boolean mainMenu = true; // mainMenu option
boolean dead = false; // dead option
boolean levels = false; // levels option

// different images
PImage player;

PImage laser0Left;
PImage laser0Right;
PImage laser0Up;
PImage laser1Left;
PImage laser1Right;
PImage laser1Up;
PImage laser2Left;
PImage laser2Right;
PImage laser2Up;
  
PImage laserBeamUp;
PImage laserBeam;

ArrayList <laser> LaserList = new ArrayList <laser> (); // array for lasers
ArrayList <laser> LaserList2 = new ArrayList <laser> (); // array for lasers
ArrayList <obstacle> ObstacleList = new ArrayList <obstacle>(); // array for obstacles

player a = new player(pX1, pY1); // constructor til player

void setup() {
  frameRate(120); // framerate
  size(680, 680); // size for the window
  ob = new obstacle(900, 900); // makes an obstacle 
  ObstacleList.add(ob); // adds the ostacle to the array so its not empty
  startTime = millis(); // start timer
  obstacleTime  = millis(); // starter timingen for obstacles
  player = loadImage("spaceship.png");
  laser0Left = loadImage("Laser0Left.png");
  laser0Right = loadImage("Laser0Right.png");
  laser0Up = loadImage("Laser0Up.png");
  laser1Left = loadImage("Laser1Left.png");
  laser1Right = loadImage("Laser1Right.png");
  laser1Up = loadImage("Laser1Up.png");
  laser2Left = loadImage("Laser2Left.png");
  laser2Right = loadImage("Laser2Right.png");
  laser2Up = loadImage("Laser2Up.png");
  laserBeamUp = loadImage("LaserBeamUp.png");
  laserBeam = loadImage("LaserBeam.png");
  for (float o = 0; o<8; o++) { // for loop makes lasers
    laser b = new laser(); // makes 8 lasers
    LaserList.add(b); // adds lasers to arraylist
  }
  for (float o = 0; o<8; o++) { // for loop makes lasers
    laser c = new laser(); // makes 8 lasers
    LaserList2.add(c); // adds lasers to arraylist
  }
}

void draw() {
  clear();
  background(255, 255, 255);
  rectMode(CENTER);
  textAlign(CENTER);
  textSize(40);
  int currentTime = millis() - startTime; // starts timer
  if (mainMenu == true) { // mainmenu checks if main menu should be shown
    mainMenu(); // 
    return; // returns so it exists out of function
  } else if (dead == true) { //dead checks if player is dead
    int currentScore = currentTime;
    dead(currentTime, currentScore = currentTime);
    return;
  } else if (levels == true) { //levels checks if levels should be shown
    levels();
    return;
  } else {
    checkLevel(); // function that checks what lvl is chosen
    int currentTimer = millis() - obstacleTime;
    if (currentTime >= levelTime) { // Checks if level is over
      int currentScore = currentTime;
      win( currentTime, currentScore = currentTime); // draws win screen
      return;
    }
    takeScore = true;
    text("second " + currentTime/1000 + " out of " + levelTime/1000, 200, 50); // displays playtime
    int posx = 60; // pos x for the first laser
    int posy = 130; // pos y for the firstr laser
    rectMode(CORNER);
    grid(100, 100, 580, 100, 100, 100, 100, 580); // funktion for making the grid
    up = false; // makes lasers face sideways
    for (laser b : LaserList) { // for loop goes thru the first row of lasers
      b.drawLaser(posx, posy, chance, laser0Right, laser1Right, laser2Right, up, laserBeam, chargeTime); // draws the lasers to the screen
      posy = posy + 60; // plus 60 after drawing each laser
    }

    posx = 130; //  pos x for the first laser
    posy = 620; // pos y for the first bottom laser
    up = true; // lasers faces up true
    for (laser c : LaserList2) {
      c.drawLaser(posx, posy, chance, laser0Up, laser1Up, laser2Up, up, laserBeamUp, chargeTime); // tegner laserne
      posx = posx + 60;
    }
    a.drawPlayer(player); // draws player
    // text(mouseX + " " + mouseY, mouseX, mouseY);
    if (obstacle == true) { // if above level 3
      rectMode(CENTER);
      if (currentTimer >= 10000) { // if the level has been going on for 10 seconds
        obstacleTime = millis(); // reset timer
        int randomX = int(random(0, 8)); // gets a random number from 0 to 8
        int randomY = int(random(0, 8));
        println((a.x1 -130) / 60);
        println((a.y1 -130 / 60));
        if ((a.x1 -130) / 60 == randomX) { // checks if x cordinate of player and box is the same
          if (randomX == 7) { // checks if the box should be moved left
            randomX--; // moves the box left
          } else if (randomX == 0) { // checks if the box should be moved right
            randomX++; // moves the box right
          } else {
            randomX++;
          }
        } else if ((a.y1 -130) / 60 == randomY) { // checks if y cordinate of player and box is the same
          if (randomY == 7) { // checks if the box should be moved up
            randomY--; // moves box up
          } else if (randomY == 0) { // checks if box should be moved down
            randomY++; // moves box down
          } else {
            randomY++;
          }
        }
        int obstacleX = randomX * 60 + 130; // translated the boxes cordinate fro 0-8 to the grid
        int obstacleY = randomY * 60 + 130; // translated the boxes cordinate fro 0-8 to the grid
        ob = new obstacle(obstacleX, obstacleY); // adds the box
        ObstacleList.add(ob);
      }

      for (obstacle ob : ObstacleList) { // renders all the boxes
        ob.render();
      }
    }
  }
}

void keyPressed() { // checks if a key has been pressed
  a.movePlayer(key);
}

void grid(int vertx1, int verty1, int vertx2, int verty2, int levelx1, int levely1, int levelx2, int levely2) { // funktion for making the grid
  if (verty2 > 600) { // exit condition
  } else {
    line(vertx1, verty1, vertx2, verty2); // make a line with these cordinates
    verty1 = verty1 + 60; // adds both cordinated with 60
    verty2 = verty2 + 60;

    line(levelx1, levely1, levelx2, levely2); // makes a line that is the other direction
    levelx1 = levelx1 + 60; // adds both v
    levelx2 = levelx2 + 60;
    grid(vertx1, verty1, vertx2, verty2, levelx1, levely1, levelx2, levely2);
  }
}

void reset() {
  a.y1 = 130; //Player x1
  a.x1 = 130;
  LaserList.clear();
  LaserList2.clear();

  for (float o = 0; o<8; o++) { // for loop der tegner de lasere til venstre
    laser b = new laser(); // laver 8 lasere
    LaserList.add(b); // tilføjer dem til arraylisten
  }
  for (float o = 0; o<8; o++) { // for loop det tegner de lasere i bunden
    laser c = new laser(); // laver 8 lasere
    LaserList2.add(c); // tilføjer dem til arraylisten
  }
}

void mouseReleased() {
  clickable = true;
}
