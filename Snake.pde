class Snake {
  ArrayList <PVector> points;
  PVector direction;
  float headX, headY;
  int pointCount;
  Snake(float _headX, float _headY, int _pointCount) {
    direction = new PVector(0, 0);
    points=new ArrayList<PVector>();
    headX=_headX;
    headY=_headY;
    pointCount=_pointCount;
    initialize();
  }
  void initialize() {
    direction.x=0;
    direction.y=0;
    points.clear();
    PVector head = new PVector(headX, headY);
    points.add(head);
    for (int i=1; i<pointCount; i++) {
      PVector newPoint = new PVector(headX-i, headY);
      points.add(newPoint);
    }
  }
  void display() {
    for (PVector point : points) {
      pushStyle();
      strokeWeight(3);
      stroke(255, 0, 0);
      point(point.x, point.y);
      popStyle();
    }
    pushStyle();
    strokeWeight(5);
    fill(255, 0, 0);
    textSize(30);
    textAlign(CENTER);
    text("Snakes", width/2, 50);
    popStyle();
  }
  void move() {
    if (!(direction.x==0 && direction.y==0)) {
      for (int i=points.size()-1; i>0; i--) {
        points.get(i).x=points.get(i-1).x;
        points.get(i).y=points.get(i-1).y;
      }
      points.get(0).x+=direction.x;
      points.get(0).y+=direction.y;
    }
    if (points.get(0).x>width) {
      points.get(0).x=0;
    } 
    else if (points.get(0).x<0) {
      points.get(0).x=width;
    }
    if (points.get(0).y>width) {
      points.get(0).y=0;
    }
    else if (points.get(0).y<0) {
      points.get(0).y=height;
    }
  }
  void updateDirection(PVector newDirection) {
    if (newDirection.x != direction.x ||newDirection.y != direction.y ) {
      if (points.get(0).x + newDirection.x != points.get(1).x) {
        direction.x=newDirection.x;
      }
      if (points.get(0).y + newDirection.y != points.get(1).y) {
        direction.y=newDirection.y;
      }
    }
  }
  void incrementLength(float increasedLength) {
    PVector lastpoint=points.get(points.size()-1);
    PVector secondLastpoint=points.get(points.size()-2);
    float finalLength=constrain(increasedLength, 0, 70);
    PVector tailDirection= PVector.sub(lastpoint, secondLastpoint);
    for (int i=0; i<finalLength; i++) {
      lastpoint=points.get(points.size()-1);
      PVector newPoint = PVector.add(lastpoint, tailDirection);
      points.add(newPoint);
    }
  }
  
}
