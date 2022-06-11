Player player;
ArrayList<Enemy> enemies=new ArrayList<Enemy>();
int score;
float acc = 2;
PVector upAcc = new PVector(0, -acc);
PVector downAcc = new PVector(0, acc);
PVector leftAcc = new PVector(-acc, 0);
PVector rightAcc = new PVector(acc, 0);
int respownTimer=60;
boolean dead=false;
int lastHealthDecrease=0;
Timer timer;

boolean up, down, left, right;
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) up = true;
    else if (keyCode == DOWN) down = true;
    else if (keyCode == LEFT) left = true;
    else if (keyCode == RIGHT) right = true;
  }

  if (key==' ') {
    if (player.score<10){
      player.fire();
    }
    else{
      player.secondfire();
      
    }
  }
}
void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP) up = false;
    else if (keyCode == DOWN) down = false;
    else if (keyCode == LEFT) left = false;
    else if (keyCode == RIGHT) right = false;
  }
}
void setup() {
  size(600, 600);
  stroke(200);
  strokeWeight(2);
  fill(63);
  timer=new Timer();
  timer.startTimer(600);
  player = new Player(new PVector(width/2, height-100), new PVector(),32,32,30);

  for (int i=0; i<10; i++) {
   enemies.add(new Enemy(new PVector(random(width), random(-300,0)), new PVector(0, 2),50,50,3));
  }
  
  enemies.add(new BossEnemy(new PVector(random(-200,200), random(-200,200)),new PVector(random(-2,2),random(-2,2)),50,50,6));
  
}


void draw() {
  background(255);
  
  if (up) player.accelerate(upAcc);
  if (down) player.accelerate(downAcc);
  if (left) player.accelerate(leftAcc);
  if (right) player.accelerate(rightAcc);
  
  player.update();
  player.drawMe();
  

  for (int i=0; i<enemies.size(); i++) {

   Enemy e=enemies.get(i);    
     e.update();
     e.drawMe();
  } 
  }
