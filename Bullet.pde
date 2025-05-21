class Bullet {
  PImage bullet;
  float x, y, angle;
  float speed = 10;
  int sizeX, sizeY;

  Bullet(float x, float y, float angle) {
    this.x = x;
    this.y = y;
    this.angle = angle;

    sizeX = 15;
    sizeY = 60;
    bullet = loadImage("images/bullet.png");
  }

  void update() {
    x += cos(angle) * speed;
    y += sin(angle) * speed;
  }

  void display() {
    pushMatrix();
    translate(x, y);
    rotate(angle + PI / 2); 
    imageMode(CENTER); // Center the image
    image(bullet, 0, 0, sizeX, sizeY);
    popMatrix();
  }

  boolean collidesWith(BaseEnemy enemy) {
    return dist(this.x, this.y, enemy.x, enemy.y) < 50;
  }

  boolean isOffScreen() {
    return (x <= 0 || x > width || y <= 0 || y > height);
  }
}
