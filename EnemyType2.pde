class EnemyType2 extends BaseEnemy {
  PImage enemyImage;

  EnemyType2(int x) {
    super(x);
    speed = int(random(3, 5)); // Faster speed
    enemyImage = loadImage("images/entruck.png");
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
