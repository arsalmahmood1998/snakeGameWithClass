Snake snake;
Food food;
Score score;
void setup() {
  size(500, 500);
  snake=new Snake(width/2, height/2, 100);
  food=new Food();
  score=new Score();
}
void draw() {
  background(255);
  snake.display();
  snake.move();
  food.drawFood();
  score.drawScore();
  updateGame();
  
}
