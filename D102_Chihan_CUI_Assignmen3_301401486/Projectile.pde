class Projectile {

 PVector pos, vel, dim;
 boolean hit;
 boolean isAlive;
 color Color;

 Timer timer;
 Projectile(PVector pos, PVector vel,color Color){
   this.pos=pos;
   this.vel=vel;
   dim=new PVector(10, 10);
   hit=false;
   isAlive=true;
   this.Color=Color;

   timer=new Timer();
 }

 void update() {
   move();
   checkWalls();
   drawProjectile();
 }
  

 boolean hitenemy(Enemy e){
   if(dist(pos.x,pos.y,e.pos.x, e.pos.y)<dim.x/2+e.dim.x/2){
    return true;
    
   }
   return false;
 }
  void checkWalls() {
  if (abs(pos.x-width/2)>width/2||abs(pos.y-height/2)>height/2) {
     isAlive=false;
   }
  }
  
 void move(){
   pos.add(vel);
 }
 void drawProjectile() {
   fill(Color);
   pushMatrix();
   translate(pos.x, pos.y);
   ellipse(0, 0, dim.x, dim.y);
   popMatrix();
 }
}
