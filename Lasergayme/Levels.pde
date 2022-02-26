void levels() {
  
  back = new button(340, 320, 90, 50, "Back");
  playButton = new button(340, 390, 80, 50, "Play");

  ArrayList <button> levelList = new ArrayList <button> ();
  
  int y = 1;
  for(int i = 220; i < 500; i = i +60){
    String text = str(y);
    levelList.add(new button(i, 260, 50, 50, text));
    y++;
  }

  for(button b : levelList){
   b.render();
   b.update();
  }

  back.render();
  back.update();
  
  playButton.render();
  playButton.update();

  if (back.isClicked() == true && clickable == true) {
    mainMenu = true;
    levels = false;
    clickable = false;
    return;
  }
  if (playButton.isClicked() == true && clickable == true) {
    ObstacleList.clear();
    clickable = false;
    mainMenu = false;
    levels = false;
    obstacleTime = millis();
    startTime = millis();
    return;
  }
  int i = 1;
  for(button b : levelList){
    if (b.isClicked() == true && highestLvl >= i-1 && clickable == true) {
      selectedLvl = i;
      clickable = false;
    }
    i++;
  }

  text(selectedLvl, 340, 210);
  text("selectedLevel", 340, 150);
  //text(mouseX + " " + mouseY, mouseX, mouseY);
}

void checkLevel() {
  switch(selectedLvl) {
  case 1:
    obstacle = false;
    levelTime = 20000;
    chargeTime = 2000;
    chance = 2000;
    break;

  case 2:
    obstacle = false;
    levelTime = 45000;
    chargeTime = 1750;
    chance = 1500;
    println(chance);  
    break;

  case 3:
    levelTime = 70000;
    chargeTime = 1500;
    chance = 1200;
    obstacle = true;
    break;

  case 4:
    levelTime = 95000;
    chargeTime = 1250;
    chance = 1000;
    obstacle = true;
    break;

  case 5:
    chance = 800;
    chargeTime = 1000;
    levelTime = 120000;
    obstacle = true;
    break;
  }
}
