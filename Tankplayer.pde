class Tankplayer {
  PImage tankbody, gun;
  int x, y, gunsizeX, gunsizeY, score;
  float swing;
  ArrayList<Bullet> bullets;

  Tankplayer(int swing) {
    this.swing = swing;
    x = width / 2;
    y = height / 2;
    tankbody = loadImage("images/tankbody.png");
    gun = loadImage("images/gun.png");
    gunsizeX = 57;
    gunsizeY = 117;
    bullets = new ArrayList<Bullet>();
  }

  void display() {
    imageMode(CENTER);
    image(tankbody, x, y, 100, 130);
    for (int i = bullets.size() - 1; i >= 0; i--) {
      Bullet b = bullets.get(i);
      b.update();
      b.display();
      for (int j = enemies.size() - 1; j >= 0; j--) { // Using the polymorphic array
        BaseEnemy e = enemies.get(j); // Polymorphic behavior
        if (b.collidesWith(e))
        {
          bullets.remove(i);
          e.explode();
          
          if(b.collidesWith(e) && e.exploded){
            score += 1;
          }
          
          if (e.isOffScreen())
          {
            enemies.remove(j);
          }
          return; // Exit the inner loop to avoid concurrent modification issues
        }
      }
      if (b.isOffScreen()) {
        bullets.remove(i);
      }
    }
  }

  void gunrender() {
    pushMatrix();
    translate(x, y);
    rotate(radians(swing));
    translate(0, -27);
    image(gun, 0, 0, gunsizeX, gunsizeY);
    popMatrix();
  }

  void fire() {
    float bulletX = x + cos(radians(swing));
    float bulletY = y + sin(radians(swing));
    float bulletAngle = radians(swing - 90);
    bullets.add(new Bullet(bulletX, bulletY, bulletAngle));
  }
}
