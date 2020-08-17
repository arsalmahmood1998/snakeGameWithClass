void keyPressed() {
  if (key==CODED) {
    PVector newDirection=new PVector(0, 0);
    if (keyCode == UP) {
      newDirection.y-=1;
    } 
    else if (keyCode == DOWN) {
      newDirection.y+=1;
    } 
    else if (keyCode == LEFT) {
      newDirection.x-=1;
    }
    else if (keyCode == RIGHT) {
      newDirection.x+=1;
    }
    gameManager.updateSnakeDirection(newDirection);
  } 
  else {
    gameManager.reset();
  }
}
void gameOver() {
  pushStyle();
  fill(255, 0, 0);
  textSize(75);
  textAlign(CENTER, CENTER);
  text("Game Over..! ", width/2, height/2);
  popStyle();
}
