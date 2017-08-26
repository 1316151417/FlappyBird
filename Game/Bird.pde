public class Bird {
  private float x = 100;
  private float y = 50;
  private float vx = 0;
  private float vy = 0;
  private float a = 300;
  private String state = "live";
  private PImage image = loadImage("picture\\bird.jpg");
  public Bird() {
  }
  public Bird(float x, float y, float vx, float vy, float a) {
    super();
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
    this.a = a;
  }
  public float getX() {
    return x;
  }
  public void setX(float x) {
    this.x = x;
  }
  public float getY() {
    return y;
  }
  public void setY(float y) {
    this.y = y;
  }
  public float getVx() {
    return vx;
  }
  public void setVx(float vx) {
    this.vx = vx;
  }
  public float getVy() {
    return vy;
  }
  public void setVy(float vy) {
    this.vy = vy;
  }
  public float getA() {
    return a;
  }
  public void setA(float a) {
    this.a = a;
  }
  public String getState() {
    return state;
  }
  public void setState(String state) {
    this.state = state;
  }
  public void update(){
    if(state.equals("live")){
      vy += (a/frameRate);
      y += (vy/frameRate);
      if(y < 0){
        y = 0;
        vy = 0;
        a = 300;
      }
      if(y >= height){
        state = "dead";
      }
    }
  }
  public void fly(){
    if(state.equals("live")){
      vy = -120;
      a = -100;
      count = 0;
    }
  }
  int count = 0;
  public void show(){
    if(count==10){
      a = 300;
    }
    fill(0);
    image(image,x-10,y-10,20,20);
    //ellipse(x,y,20,20);
    fill(255);
    count++;
  }
}