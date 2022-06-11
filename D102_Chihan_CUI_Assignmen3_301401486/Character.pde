//a class to describe a generic Character
class Character {
  //fields for motion
  PVector pos, vel;
  float damp = 0.8;
  float characterwidth;
  float characterheight;
  int deathtimer=-1;
  int health;

  Character(PVector pos, PVector vel,float characterwidth,float characterheight,int health) {
    this.pos = pos;
    this.vel = vel;
    this.characterwidth=characterwidth;
    this.characterheight=characterheight;
    this.health=health;
  }
  void accelerate(PVector acc) {
    vel.add(acc);
  }
  void moveCharacter(){
   pos.add(vel); 
  }
  void drecreasehealth(){
   health--; 
    
  }

  boolean hitCharacter(Character p){
   if (abs(pos.x-p.pos.x)<(characterwidth/2+p.characterwidth/2) && abs(pos.y-p.pos.y)<(characterheight/2)+p.characterheight/2 ){
     return true;
  }
  return false;
  }
   //update the physics for the character
  void update() {
    vel.mult(damp); //multiply velocity by dampening factor (0.9-0.99);
    moveCharacter();//add velocity to position (moves character)
    checkWalls();
  }
  //check boundaries 
  void checkWalls(){
     if (pos.x > width) pos.x = 0;
    if (pos.x < 0) pos.x = width;
    if (pos.y > height) pos.y = 0;
    if (pos.y < 0) pos.y = height;
  }
  // drawing character
  void draw() {    
    pushMatrix();
    translate(pos.x, pos.y);
    ellipse(0, 0, 32, 32);
    popMatrix();
  }
}
