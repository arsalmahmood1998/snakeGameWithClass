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
  void moveGame() {
    snake.move();
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
    // for (int i=0; i<foodsCount; i++) {
    //  Food newfood=new Food();
    //  foods.add(newfood);
    //} 
    foodsCount=(int)random(1, 10);
    println(foodsCount);
    foods.add(new Food());
    for (int i=0; i<foodsCount-1; i++) {
      println("size"+foods.size());
      println("i="+i);
      Food newFood=new Food();
      boolean result=false;
      for (int j=0; j<foods.size(); j++) {
        println("j="+j);
        Food existingFood=new Food();
        if (dist(newFood.location.x, newFood.location.y, existingFood.location.x, existingFood.location.y)>newFood.radius) {
          result=true;
        }
        else{
          result=false;
        }
      }
      if (result) {
        foods.add(newFood);
        println("foodAdded");
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
  boolean hitTest() {
    boolean result=false;
    for (int i=1; i<snake.points.size(); i++) {
      if (snake.points.get(0).x==snake.points.get(i).x && snake.points.get(0).y==snake.points.get(i).y) {
        snake.updateDirection(new PVector(0, 0));
        result=true;
      }
    }
    for (int i=foods.size()-1; i>=0; i--) {
      float dist=dist(snake.points.get(0).x, snake.points.get(0).y, foods.get(i).location.x, foods.get(i).location.y);
      if (dist<=foods.get(i).radius/2) {
        foods.remove(foods.get(i));
        score+=2;
        snake.incrementLength(score*2.5);
        println("FoodRemove");
      }
    }
    return result;
  }
}
