class Player extends Character{
  ArrayList<Projectile> projectiles= new ArrayList<Projectile>();
  boolean isAlive;
  int score;
  Player(PVector pos, PVector vel,float characterwidth,float characterheight,int health){
   super(pos,vel,characterwidth,characterheight,health); 
    isAlive=true;
    score=0;
  }

  void fire() {
    projectiles.add(new Projectile(new PVector(pos.x, pos.y), new PVector(0, -5),color(0, 0, 200)));      
  }
  
  void secondfire(){
    projectiles.add(new Projectile(new PVector(pos.x, pos.y), new PVector(random(-1,1), random(-1,1)),color(0, 175, 200)));
  }

  void update(){
    super.update();
    checkProjectiles();
      drawScore();
  }
  void checkProjectiles(){
     for (int i=0; i<projectiles.size(); i++) {
     Projectile p = projectiles.get(i);
     p.update();
     for (int j=0; j<enemies.size(); j++) {
       Enemy e = enemies.get(j);
       ;       if (p.hitenemy(e)){
          score++;
          e.drecreasehealth();
          projectiles.remove(i);
          println(e.health);
       }
       if(e.health==0){
         e.captured();
         e.update();
       } 
       
       }
       
     }
    }
  void drawMe(){
    super.draw();
    fill(0);
    pushMatrix();
    translate(pos.x, pos.y);
    triangle(0, -15, -10, 0,10,0);
    triangle(0, -5, -2.5, 0, 2.5, 0);
    triangle(-10,0,-22,15,0,10);
    triangle(10,0,22,15,0,10);
    popMatrix();
  } 
 void  drawScore() {

  fill(0);
  if(score==1){
    text("You attact enemies "+score+" times.", 20, 50);
  }
  else if (score>1){
    text("You attact enemies "+score+" times.", 20, 50);
  }
} 
 

  }
