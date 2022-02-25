
  void win(int time, int score){
    if (takeScore == true) {
    score = time;
    switch(selectedLvl) {
    case 1:
      if (score > highscore1) {
        highscore1 = score;
      }
      break;

    case 2: 
      if (score > highscore2) {
        highscore2 = score;
      }
      break;

    case 3: 
      if (score > highscore3) {
        highscore3 = score;
      }
      break;

    case 4: 
      if (score > highscore4) {
        highscore4 = score;
      }
      break;

    case 5: 
      if (score > highscore5) {
        highscore5 = score;
      }
      break;
    }

    takeScore = false;
  }
    main = new button(340, 340, 200, 50, "Mainmenu");
    next = new button(340, 400, 200, 50, "Next level");
    
    main.render();
    main.update();
    
    next.render();
    next.update();
    
    if (highestLvl < selectedLvl){
        highestLvl = selectedLvl;
    }
    
    if(main.isClicked() == true && clickable == true){
      mainMenu = true;
      dead = false;
      clickable = false;
    }
    
    if(next.isClicked() == true && clickable == true){
      startTime = millis();
      obstacleTime = millis();
      ObstacleList.clear();
      reset();
      selectedLvl++;
      clickable = false;
    }
    text("Level " + selectedLvl + " completed!",340 ,290);
    
  }
