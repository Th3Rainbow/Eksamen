void levels() {
  
  back = new button(340, 320, 90, 50, "Back");

  ArrayList <button> levelList = new ArrayList <button> ();
  
  levelList.add(new button(220, 260, 50, 50, "1"));
  levelList.add(new button(280, 260, 50, 50, "2"));
  levelList.add(new button(340, 260, 50, 50, "3"));
  levelList.add(new button(400, 260, 50, 50, "4"));
  levelList.add(new button(460, 260, 50, 50, "5"));

  /*level1 = new button(220, 260, 50, 50, "1");
  level2 = new button(280, 260, 50, 50, "2");
  level3 = new button(340, 260, 50, 50, "3");
  level4 = new button(400, 260, 50, 50, "4");
  level5 = new button(460, 260, 50, 50, "5");*/
  
  for(button b : levelList){
   b.render();
   b.update();
  }

  back.render();
  back.update();
/*
  level1.render();
  level1.update();
  level2.render();
  level2.update();
  level3.render();
  level3.update();
  level4.render();
  level4.update();
  level5.render();
  level5.update();
  */

  if (back.isClicked() == true && clickable == true) {
    mainMenu = true;
    levels = false;
    clickable = false;
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
/*
  if (level1.isClicked() == true && highestLvl >= 0 && clickable == true) {
    selectedLvl = 1;
    clickable = false;
  }
  if (level2.isClicked() == true && highestLvl >= 1 && clickable == true) {
    selectedLvl = 2;
    clickable = false;
  }
  if (level3.isClicked() == true && highestLvl >= 2 && clickable == true) {
    selectedLvl = 3;
    clickable = false;
  }
  if (level4.isClicked() == true && highestLvl >= 3 && clickable == true) {
    selectedLvl = 4;
    clickable = false;
  }
  if (level5.isClicked() == true && highestLvl >= 4 && clickable == true) {
    selectedLvl = 5;
    clickable = false;
  }
  */

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
    chance = 1000;
    obstacle = true;
    break;

  case 4:
    levelTime = 95000;
    chargeTime = 1250;
    chance = 800;
    obstacle = true;
    break;

  case 5:
    chance = 600;
    chargeTime = 1000;
    levelTime = 120000;
    obstacle = true;
    break;
  }
}
