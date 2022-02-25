
  void mainMenu(){
    
    playButton = new button(340, 390, 80, 50, "Play");
    levelsButton = new button(340, 310, 200, 50, "Levels");
    
    playButton.render();
    playButton.update();
    levelsButton.render();
    fill(0, 0, 0);
    text("MainMenu", 340, 250);
    noFill();
   // text(mouseX + " " + mouseY, mouseX, mouseY);
   // println(clickable);
    
    if(playButton.isClicked() == true && clickable == true){
      ObstacleList.clear();
      clickable = false;
      mainMenu = false;
      startTime = millis();
      return;
    }
    levelsButton.update();
    if(levelsButton.isClicked() == true && clickable == true){
      levels = true;
      mainMenu = false; 
      clickable = false;
    }
}
