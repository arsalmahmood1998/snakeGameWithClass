Snake snake;
Food food;
int score=0;
void setup() {
  size(500, 500);
  snake=new Snake(width/2, height/2, 100);
  food=new Food();
}
void draw() {
  background(255);
  snake.display();
  snake.move();
  food.drawFood();
  drawScore();
  updateGame();
  
}
 void  drawScore() {
    pushStyle();
    fill(255,100, 51);
    textSize(30);
    text("Score="+" "+score, 50, 50);
    popStyle();
  }
