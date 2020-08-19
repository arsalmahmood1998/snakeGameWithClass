class Manager {
  Snake snake;
  ArrayList <Food> foods;
  int score=0;
  int foodsCount;
  Manager() {
    snake=new Snake(width/2, height/2, 100);
    foods=new ArrayList <Food>();
    reset();
  }
  void displayGame() {
    snake.display();
    drawScore();
    for (Food currentFood : foods) {
      currentFood.drawFood();
    }
  }
  void updateGame() {
    snake.move();
    ateFood();
    boolean gameOver=gameManager.didGameOver();
    if (gameOver) {
      gameOver();
    }
  }
  void updateSnakeDirection(PVector newDirection) {
    snake.updateDirection(newDirection);
  }
  void reset() {
    snake.initialize();
    score=0;
    foods.clear();
    addFood();
  }
  void addFood() {
    foodsCount=4;
    foods.add(new Food());
    for (int i=0; i<foodsCount-1; i++) {
      Food newFood=new Food();
      boolean addFood=true;
      int j=0;
      while ( j<foods.size() &&  addFood==true) {
        Food existingFood=foods.get(j);
        if (dist(newFood.location.x, newFood.location.y, existingFood.location.x, existingFood.location.y)>newFood.radius*2) {
          addFood=true;
        } 
        else {
          addFood=false;
        }
        j++;
      }
      int k=0;
      while (k<snake.points.size() && addFood==true) {
        if (dist(newFood.location.x, newFood.location.y, snake.points.get(k).x, snake.points.get(k).y)>newFood.radius*2) {
          addFood=true;
        } 
        else {
          addFood=false;
        }
        k++;
      }
      if (addFood) {
        foods.add(newFood);
      } 
      else {
        i--;
      }
    }
  }
  void drawScore() {
    pushStyle();
    fill(255, 0, 0);
    textSize(30);
    text("Score="+score, 20, 50);
    popStyle();
  }
  boolean didGameOver() {
    boolean result=false;
    for (int i=1; i<snake.points.size(); i++) {
      if (snake.points.get(0).x==snake.points.get(i).x && snake.points.get(0).y==snake.points.get(i).y) {
        snake.updateDirection(new PVector(0, 0));
        result=true;
      }
    }
    return result;
  }
  void ateFood() {
    for (int i=foods.size()-1; i>=0; i--) {
      float dist=dist(snake.points.get(0).x, snake.points.get(0).y, foods.get(i).location.x, foods.get(i).location.y);
      if (dist<=foods.get(i).radius) {
        foods.remove(foods.get(i));
        score+=2;
        snake.incrementLength(score*2.5);
      }
    }
    if (foods.size()==0) {
      addFood();
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
}
