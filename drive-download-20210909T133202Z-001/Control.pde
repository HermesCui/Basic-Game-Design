float speed = 2;
PVector upForce = new PVector(0, -speed);
PVector leftForce = new PVector(-speed, 0);
PVector rightForce = new PVector(speed, 0);
PVector downForce = new PVector(0, speed); 
boolean up, left, right, down, cut;

void keyPressed() {
  if (key=='w') up=true;
  if (key=='s') down=true;
  if (key=='a') left=true;
  if (key=='d') right=true;
  if (key == ' ') {
    player.cutting=true;
  }
}
void keyReleased() {
  if (key=='w') up=false;
  if (key=='s') down=!true;
  if (key=='a') left=!true;
  if (key=='d') right=!true;
  if (key == ' ') {
    player.cutting=false;
  }
}
