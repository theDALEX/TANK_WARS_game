abstract class BaseEnemy{
  int x, y, sizeX, sizeY, speed;
  PImage[] explosionImages = new PImage[3];
  int explosionSize = 200;
  int explosionFrame = 0;
  int explosionFrameDuration = 10; // Number of frames each explosion image lasts
  int explosionFrameCounter = 0;
  boolean exploded = false;

  BaseEnemy(int x){
    this.x = x;
    y = -10;
    sizeX = 95;
    sizeY = 150;
    // Load explosion images
    explosionImages[0] = loadImage("images/ex1.png");
    explosionImages[1] = loadImage("images/ex2.png");
    explosionImages[2] = loadImage("images/ex3.png");
  }

  void update(){
    // This function will be overridden by subclasses
    y += speed;
  }

  void display() {
    // This function will be overridden by subclasses
  }

  void explode(){
    if (exploded){
      if (explosionFrame < explosionImages.length) {
        image(explosionImages[explosionFrame], x, y, explosionSize, explosionSize);
        explosionFrameCounter++;
        if (explosionFrameCounter >= explosionFrameDuration) {
          explosionFrame++;
          explosionFrameCounter = 0;
        }
      }
    }
    else{
      exploded = true;
      explosionFrame = 0; // Start animation from the first frame
    }
  }

  boolean isOffScreen(){
    return (y > height);
  }
}
