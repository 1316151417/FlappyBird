String state = "option";
Bird bird;
Obstacle[] obstacles;
int obstaclesSize;
float speed = 1;
void setup(){
  smooth();
  frameRate(120);
  bird = new Bird();
  obstaclesSize = 30;
  obstacles = new Obstacle[obstaclesSize];
  size(500,300);
}
void draw(){
  //background(90,220,220);
  background(#55DDE9);
  if(state.equals("option")){
    option();
  }else if(state.equals("new")){
    bird.show();
    for(Obstacle o : obstacles){
      o.show();
    }
  }else if(state.equals("start")){
    bird.update();
    bird.show();
    for(Obstacle o : obstacles){
      o.update();
      o.show();
    }
    judge();
  }else if(state.equals("over")){
    over();
  }else if(state.equals("win")){
    win();
  }
}
void mousePressed(){
  if(state.equals("option")){
    if(mouseX > 80 && mouseX < 150 && mouseY > 200 && mouseY < 230){
      speed = 1.5;
      state = "new";
      for(int i=0;i<obstaclesSize;i++){
        float x = 300 + i*200;
        float h = random(0,100);
        obstacles[i] = new Obstacle(x,0,20,h,x,h+80,20,300-h-80,speed);
      }
    }
    if(mouseX > 230 && mouseX < 300 && mouseY > 200 && mouseY < 230){
      speed = 1.8;
      state = "new";
      for(int i=0;i<obstaclesSize;i++){
        float x = 300 + i*200;
        float h = random(0,100);
        obstacles[i] = new Obstacle(x,0,20,h,x,h+80,20,300-h-80,speed);
      }
    }
    if(mouseX > 380 && mouseX < 450 && mouseY > 200 && mouseY < 230){
      speed = 2.3;
      state = "new";
      for(int i=0;i<obstaclesSize;i++){
        float x = 300 + i*200;
        float h = random(0,100);
        obstacles[i] = new Obstacle(x,0,20,h,x,h+80,20,300-h-80,speed);
      }
    }
  }else if(state.equals("new")){
    state = "start";
  }else if(state.equals("start")){
    bird.fly();
  }else if(state.equals("over")){
    if(mouseX > 230 && mouseX < 300 && mouseY > 200 && mouseY < 230){
      bird = new Bird();
      state = "option";
    }
  }else if(state.equals("win")){
    if(mouseX > 230 && mouseX < 300 && mouseY > 200 && mouseY < 230){
      bird = new Bird();
      state = "option";
    }
  }
}
void option(){
  rect(80,200,70,30);
  rect(230,200,70,30);
  rect(380,200,70,30);
  fill(0);
  textSize(50);
  text("Game",180,100);
  textSize(15);
  text("easy",90,220);
  text("normal",240,220);
  text("difficult",390,220);
  fill(255);
}
void judge(){
  for(Obstacle o : obstacles){
    if(o.touch(bird)){
      bird.setState("dead");
    }
  }
  if(bird.getState().equals("dead")){
    state = "over";
  }
  if(bird.getX() > obstacles[obstaclesSize-1].getX1() + obstacles[obstaclesSize-1].getWidth1() + 100){
    state = "win";
  }
}
void over(){
  rect(230,200,70,30);
  fill(0);
  textSize(50);
  text("Game Over",100,100);
  textSize(15);
  text("restart",240,220);
  fill(255);
}
void win(){
  rect(230,200,70,30);
  fill(0);
  textSize(50);
  text("Win",180,100);
  textSize(15);
  text("restart",240,220);
  fill(255);
}