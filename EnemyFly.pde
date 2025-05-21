class EnemyFly extends BaseEnemy{
  PImage enemyPlane;
  int move;
  
  EnemyFly(int x){
    super(x); 
    speed = 2;
    enemyPlane = loadImage("images/plane.png");
  }
  
  void display(){
    image(enemyPlane,x,y);
    x += int(random(-2,2));
  }
  
  void move(int movepos){
    x += movepos;
  }
  
  void explode(){
    super.explode();
    explosionSize = 350;
  }
  
  boolean collidesWith(Tankplayer tank) {
    return dist(this.x, this.y, tank.x, tank.y) < 100;
  }
}
