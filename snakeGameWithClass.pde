Snake snake;
void setup() {
  size(500, 500);
  snake=new Snake(width/2, height/2, 100);
}
void draw() {
  background(255);
  snake.display();
  snake.move();
}
