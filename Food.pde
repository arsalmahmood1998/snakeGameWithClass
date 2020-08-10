class Food {
  PVector food;
  float radius=20;
  color foodColor=color(random(255), random(255), random(255));
  Food() {
    food=new PVector();
    food.x=(random(radius/2, width-radius/2));
    food.y=random(radius/2, height-radius/2);
  }
  void drawFood() {
    pushStyle();
    fill(foodColor);
    stroke(red(foodColor), green(foodColor), blue(foodColor), 100);
    strokeWeight(3);
    circle(food.x, food.y, radius);
    popStyle();
  }
}
