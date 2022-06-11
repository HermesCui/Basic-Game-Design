import processing.sound.*;//main music
SoundFile mainTheme;//soundmaintheme

Knight player;//player
PImage[] knightSitting;
PImage[] knightWalking;
PImage[] knightCutting;

int repeatX;
int repeatY;

int cases=0;

int gameState = 0;//gamestates


void setup() {
  smooth();
  size(800, 600);
  mainTheme =new SoundFile(this, "data/music/villagetheme.wav");
  //backgrounds.add(new Background("data/knight_states/knight1.png", 100, 100));
  player = new Knight(new PVector(width/2, height/2));//player array
  knightAction();//knightaction
  sound();//maintheme‘
}

void draw() {
  background(255);
  switch (gameState) {
  case 0: 
    gameplay(); 
    cases=0;
    break;
    //case 1: 
    // gameOver("You Win!! \nYour Score: "+score); 
    // break;
    //case 2: 
    // gameOver("Game Over \nTry Again!!"); 
    // break;
  }
}
void gameplay() {
  if (up) player.accelerate(upForce);
  if (down) player.accelerate(downForce);
  if (left) player.accelerate(leftForce);
  if (right) player.accelerate(rightForce);
  player.update();
}//end of gameplay

void knightAction() {
  knightSitting= new PImage[4];
  loadFrames(knightSitting, 4, "data/knight_states/knight", 100, 100, 1);
  knightWalking= new PImage[6];
  loadFrames(knightWalking, 6, "data/knight walk/knightwalk", 100, 100, 1);
  knightCutting= new PImage[4];
  loadFrames(knightCutting, 4, "data/knight cut/knightcut", 100, 100, 1);
}//end of knightaction

void loadFrames(PImage[] ar, int n, String fname, int img_width, int img_height, int start) {
  // load images into ar given a file name
  for (int i=0; i<n; i++) {
    ar[i]= loadImage(fname + (start+i) + ".png");
    ar[i].resize(img_width, img_height);
  }
}//end ofloadframes

void sound() {
  if (cases==0) {//soundset
    //mainTheme.loop();
    mainTheme.amp(0.5);
  }
}//end of sound
