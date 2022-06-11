class Timer{
 int count;
 Timer(){
  count=-1; 
 }
  void startTimer(int x){
   count=x; 
  }
  void update(){
   count--; 
  }
  boolean timerEnded(){
   return(count==0); 
  }
}
