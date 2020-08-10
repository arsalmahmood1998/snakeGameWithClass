class Food {
  PVector foodLocation;
  float radius=20;
  color foodColor=color(random(255), random(255), random(255));
  Food() {
    foodLocation=new PVector();
    foodLocation.x=(random(radius/2, width-radius/2));
    foodLocation.y=random(radius/2, height-radius/2);
  }
  void drawFood() {
    pushStyle();
    fill(foodColor);
    stroke(red(foodColor), green(foodColor), blue(foodColor), 100);
    strokeWeight(3);
    circle(foodLocation.x, foodLocation.y, radius);
    popStyle();
  }
}
