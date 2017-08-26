public class Obstacle {
  private float x1;
  private float y1;
  private float width1;
  private float height1;
  private float x2;
  private float y2;
  private float width2;
  private float height2;
  private float speed;
  private int K;
  public Obstacle() {
  }
  public Obstacle(float x1, float y1, float width1, float height1, float x2,
      float y2, float width2, float height2, float speed) {
    super();
    this.x1 = x1;
    this.y1 = y1;
    this.width1 = width1;
    this.height1 = height1;
    this.x2 = x2;
    this.y2 = y2;
    this.width2 = width2;
    this.height2 = height2;
    this.speed = speed;
  }
  public float getX1() {
    return x1;
  }
  public void setX1(float x1) {
    this.x1 = x1;
  }
  public float getY1() {
    return y1;
  }
  public void setY1(float y1) {
    this.y1 = y1;
  }
  public float getWidth1() {
    return width1;
  }
  public void setWidth1(float width1) {
    this.width1 = width1;
  }
  public float getHeight1() {
    return height1;
  }
  public void setHeight1(float height1) {
    this.height1 = height1;
  }
  public float getX2() {
    return x2;
  }
  public void setX2(float x2) {
    this.x2 = x2;
  }
  public float getY2() {
    return y2;
  }
  public void setY2(float y2) {
    this.y2 = y2;
  }
  public float getWidth2() {
    return width2;
  }
  public void setWidth2(float width2) {
    this.width2 = width2;
  }
  public float getHeight2() {
    return height2;
  }
  public void setHeight2(float speed) {
    this.speed = speed;
  }
  public float getSpeed() {
    return height2;
  }
  public void setSpeed(float speed) {
    this.speed = speed;
  }
  public void update(){
    x1 -= speed;
    x2 -= speed;
  }
  public void show(){
    fill(20,210,20);
    rect(x1,y1,width1,height1);
    rect(x2,y2,width2,height2);
    fill(255);
   // text(x1*100/frameRate,50,50);
  }
  public boolean touch(Bird bird){
    if(bird.getY() < y1+height1){
      if(abs(bird.getX() - (x1+width1/2)) < 10 + width1/2){
        return true;
      }
    }else if(bird.getY() > y2){
      if(abs(bird.getX() - (x2+width2/2)) < 10 + width2/2){
        return true;
      }
    }else{
      if(bird.getX() > x1 && bird.getX() < x1 + width1){
        if(abs(bird.getY() - (y1+height1)) < 10){
          return true; 
        }
        if(abs(bird.getY() - (y2)) < 10){
          return true;
        }
      }
    }
    return false;
  }
}