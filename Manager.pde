class Manager {
  Snake snake;
  ArrayList <Food> foods;
  int score=0;
  int foodsCount=20;
  Manager() {
    snake=new Snake(width/2, height/2, 100);
    foods=new ArrayList <Food>();
    for (int i=0; i<foodsCount; i++) {
      Food newfood=new Food();
      foods.add(newfood);
    }
  }
  void displayGame() {
    snake.display();
    drawScore();
    for (Food currentFood : foods) {
      currentFood.drawFood();
    }
  }
  void moveGame() {
    snake.move();
  }
  void updateSnakeDirection(PVector newDirection) {
    snake.updateDirection(newDirection);
  }
  void reset() {
    snake.initialize();
    score=0;
  }
  void drawScore() {
    pushStyle();
    fill(255, 0, 0);
    textSize(30);
    text("Score="+score, 20, 50);
    popStyle();
  }
  boolean hitTest() {
    boolean result=false;
    for (int i=1; i<snake.points.size(); i++) {
      if (snake.points.get(0).x==snake.points.get(i).x && snake.points.get(0).y==snake.points.get(i).y) {
        snake.updateDirection(new PVector(0, 0));
        result=true;
      }
    }
    for (Food currentFood : foods) {
      float dist=dist(snake.points.get(0).x, snake.points.get(0).y, currentFood.location.x, currentFood.location.y);
      if (dist<=currentFood.radius/2) {
        currentFood.location.x=random(currentFood.radius/2, width-currentFood.radius/2);
        currentFood.location.y=random(currentFood.radius/2+50, height-currentFood.radius/2);
        score+=2;
        snake.incrementLength(score*2.5);
      }
    }
    return result;
  }
}
