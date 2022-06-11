class BossEnemy extends Enemy{
  PVector dim;
  boolean dead;
  ArrayList<Projectile> projectiles= new ArrayList<Projectile>();
  BossEnemy(PVector pos, PVector vel,float characterwidth,float characterheight,int health){
    super(pos,vel,characterwidth,characterheight,health);
    dim=new PVector(100,100);
    dead=false;
  }
  void autofire(){
    projectiles.add(new Projectile(new PVector(pos.x, pos.y), new PVector(random(-1,1), random(-1,1)),color(225)));   
  }
  void checkProjectiles(){
    
     for (int i=0; i<projectiles.size(); i++) {
     Projectile p = projectiles.get(i);
     p.update();
      if(dist(p.pos.x,p.pos.y,player.pos.x,player.pos.y)<30 && player.health>0){
         player.drecreasehealth();
         println(player.health);
         projectiles.remove(i);
         dead=true;
      }
      if (player.health==0 && dead){
          player.health=0;
          background(0,255,0);
          pushStyle();
          textSize(30);
          textAlign(CENTER);
          fill(255);
          text("You are killed",width/2,height/2);
          popStyle();        
      }
     }
  }
  
  void drawBOSS(){
    super.draw();
   fill(30, 0, 0);
   pushMatrix();
   translate(pos.x, pos.y);
   ellipse(0, 0, dim.x, dim.y);
   fill(70,69,115);
   ellipse(0,0,dim.x,dim.x);
   popMatrix();  
  }
 void captured(){
     timer.startTimer(60*3);
     vel.x=0;
     vel.y=0;
   
 }
  void update(){
   super.checkWalls();
   super.update();
   checkProjectiles();
   drawBOSS();
   autofire();

  }
  
}
