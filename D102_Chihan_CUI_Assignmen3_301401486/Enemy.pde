class Enemy extends Character{
  PVector dim;
  Timer timer;


  boolean hit=false;
  boolean display=true;
  int score=0;
  Enemy(PVector pos, PVector vel,float characterwidth,float characterheight,int health){
    super(pos,vel,characterwidth,characterheight,health);
    dim=new PVector(50,50);
    timer=new Timer();

    
  }
  //detect the collison between player and enemy
  void checkhit(){
      for (int i=0; i<enemies.size(); i++) {

   Enemy e=enemies.get(i);

    if(e.hitCharacter(player) && player.health>0 && (frameCount-60>lastHealthDecrease)   ){
      player.drecreasehealth();
      dead=false;
      println(player.health);
      lastHealthDecrease=frameCount;
    }        
      if ((player.health==0) ){
          player.health=0;
          background(255,0,0);
          pushStyle();
          textSize(30);
          textAlign(CENTER);
          fill(255);
          text("Game Over!",width/2,height/2);
          popStyle();
      }
      }
  }
  void update(){
    checkhit();
    move();
    handleWalls();
    timer.update();
    if(isdead()){
      enemies.remove(this);
      display=false;
      respawn();
    } 
    display();
  }
  void move(){
   pos.add(vel); 
    
 }
  void captured(){   
     timer.startTimer(60);
     vel.x=0;
     vel.y=0;
  }

 boolean isdead(){
  return (timer.timerEnded()); 
   
 }
 void display(){
  if(health<=0){
    if(display==true){
     pushStyle();
     fill(179,0,213);
     textAlign(CENTER);
     textSize(100);
     text("die",pos.x,pos.y);
     popStyle();
    }       
    }
 
  }
   
  
  void handleWalls() {
   if (pos.y > height+dim.y) {
     enemies.remove(this);
     respawn();
   }
 }
 void respawn() {
   if (player.score<10){
   enemies.add(new Enemy(new PVector(random(width), random(0, -300)), new PVector(0, 2),20,20,3));
   }
   else if (player.score>10){
   enemies.add(new Enemy(new PVector(random(width), random(0, -300)), new PVector(3, 7),20,20,3)); 
   }
 }
  void drawMe() {
     super.draw();
     fill(random(10,150), random(50,150), 0);
     pushStyle();
     pushMatrix();
     translate(pos.x, pos.y);
     ellipse(0, 0, dim.x, dim.y);
     fill(35,25,25);
     ellipse(0,0,dim.x/2,dim.x/2);
     popMatrix();
     popStyle();
    }

    
}
