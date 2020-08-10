class Score {
  int _score;
  Score() {
    _score=0;
  }
  void  drawScore() {
    pushStyle();
    fill(255,100, 51);
    textSize(30);
    text("Score="+" "+_score, 50, 50);
    popStyle();
  }
}
