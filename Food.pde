class Food {
  PVector location;
  float radius=20;
  color foodColor=color(random(255), random(255), random(255));
  Food() {
    location=new PVector();
    location.x=(random(radius/2, width-radius/2));
    location.y=random(radius/2+50, height-radius/2);
  }
  void drawFood() {
    pushStyle();
    fill(foodColor);
    stroke(red(0), green(0), blue(0), 100);
    strokeWeight(3);
    circle(location.x, location.y, radius);
    popStyle();
  }
}
