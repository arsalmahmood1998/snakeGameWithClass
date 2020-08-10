class Score {
  int score;
  Score() {
    score=0;
  }
  void  drawScore() {
    pushStyle();
    fill(255,100, 51);
    textSize(30);
    text("Score="+" "+score, 50, 50);
    popStyle();
  }
}
