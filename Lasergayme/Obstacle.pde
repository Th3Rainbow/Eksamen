class obstacle {
  int x, y;

  obstacle(int obstacleX, int obstacleY) {
    x = obstacleX;
    y = obstacleY;
  }

  void render() {
    fill(0, 0, 0);
    rect(x, y, 50, 50);
    noFill();
  }

  boolean checkCollision(char key) {
    for(obstacle ob : ObstacleList){
    if(key == 'w' && a.y1 - 60 == ob.y && a.x1 == ob.x){
      return true;
    }
    if(key == 'a' && a.x1 - 60 == ob.x && a.y1 == ob.y){
      return true;
    }
    if(key == 's' && a.y1 + 60 == ob.y && a.x1 == ob.x ){
      return true;
    }
    if(key == 'd' && a.x1 + 60 == ob.x && a.y1 == ob.y){
      return true;
    }
    }
 return false;
   
  }
}
