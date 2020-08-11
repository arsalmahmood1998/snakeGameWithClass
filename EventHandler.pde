void keyPressed() {
  if (key==CODED) {
    PVector newDirection=new PVector(0, 0);
    if (keyCode == UP) {
      newDirection.y-=1;
    } else if (keyCode == DOWN) {
      newDirection.y+=1;
    } else if (keyCode == LEFT) {
      newDirection.x-=1;
    } else if (keyCode == RIGHT) {
      newDirection.x+=1;
    }
    snake.updateDirection(newDirection);
  }
  else{
    snake.initialize();
    score=0;
  }
}
void updateGame() {
    float dist=dist(snake.points.get(0).x, snake.points.get(0).y, food.foodLocation.x, food.foodLocation.y);
    if (dist<=food.radius/2) {
      food.foodLocation.x=random(food.radius/2, width-food.radius/2);
      food.foodLocation.y=random(food.radius/2, height-food.radius/2);
      score+=2;
      snake.incrementLength(score*2.5);
      
    }
  }
