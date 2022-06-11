class Knight {
  PVector pos, vel;
  int currentFrame=0;
  float damp = 0.7; //damping restrains
  PImage[] frames; 
  PImage img;
  boolean cutting=false;

  Knight(PVector pos) {
    this.pos=pos;
    vel = new PVector(0, 0);
    currentFrame=0;
  }

  void move() {
    pos.add(vel);
    vel.mult(damp);
    if (cutting==false) {
      if (abs(vel.x) + abs(vel.y)> 0.7) {
        walk();
      } else {
        sit();
      }
    } else {
      cut();
    }
    updateFrame();
  }
  void walk() {
    frames=knightWalking;
  }
  void sit() {
    frames= knightSitting;
  }
  void cut() {
    frames= knightCutting;
  }
  void accelerate(PVector acc) {
    vel.add(acc);
  }
  void update() {
    move();
    drawMe();
  }

  void updateFrame() {
    if ( frameCount % 5 ==0 ) {
      currentFrame++;
    }
    currentFrame = currentFrame % frames.length;
    img= frames[currentFrame];
  }

  void drawMe() {//draw the knight
    pushMatrix();
    translate(pos.x, pos.y);
    if (vel.x < 0) {
      scale(-1, 1);
    }
    image(img, -img.width/2, -img.height/2);
    popMatrix();
  }
}
