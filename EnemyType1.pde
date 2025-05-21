class EnemyType1 extends BaseEnemy{
  PImage enemyImage;

  EnemyType1(int x) {
    super(x);
    speed = 3; // Regular speed
    enemyImage = loadImage("images/ensuv.png");
  }
  
  @Override
  void update(){
    super.update();
    x += int(random(-2,2));
  }

  @Override
  void display() {
    if (!exploded) {
      image(enemyImage, x, y, sizeX, sizeY);
    } else {
      explode();
    }
  }
} 
