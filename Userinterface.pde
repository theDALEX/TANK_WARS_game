class Userinterface {
  int x, y, score, size, highScore;
  int level = 1;
  ArrayList<PImage> lifeImages;
  PImage logoimage, redskull, wintrophy;

  Userinterface(int score, int highScore) {
    this.score = score;
    this.highScore = highScore;
    x = 0;
    y = 0;
    size = 30;
    logoimage = loadImage("images/Tank_Wars_logo.png");
    redskull = loadImage("images/REDSKULL.png");
    wintrophy = loadImage("images/wintrophy.png");
    lifeImages = new ArrayList<PImage>();
    lifeImages.add(loadImage("images/heart.png"));
    lifeImages.add(loadImage("images/heart.png"));
    lifeImages.add(loadImage("images/heart.png"));
  }

  void uiRendering() {
    scoreBored();
    lifeBored();
    levelBored();
    highscoreBoard();
  }

  void scoreBored() {
    rectMode(CENTER);
    stroke(255);
    fill(0);
    rect(width - 65, 20, 100, 30);
    fill(255);
    textSize(20);
    text("SCORE: " + score, width - 100, 28);
  }
  
  void levelBored() {
    rectMode(CENTER);
    stroke(255);
    fill(0);
    rect(width - 65, 90, 100, 30);
    fill(255);
    textSize(20);
    text("LEVEL: " + level, width - 100, 98);
  }

  void lifeBored() {
    rectMode(CENTER);
    stroke(255);
    fill(0);
    rect(width - 65, 55, 100, 30);
    fill(255);
    for (int i = 0; i < lifeImages.size(); i++) {
      image(lifeImages.get(i), width - 100 + i * 35, 55, size, size);
    }
  }

  void removeLife()
  {
    if (!lifeImages.isEmpty()) {
      lifeImages.remove(lifeImages.size() - 1); // Remove the last life image
    }
  }
  
  void highscoreBoard() {
    rectMode(CENTER);
    stroke(255);
    fill(0);
    rect(80, 20, 150, 30);
    fill(255);
    textSize(20);
    text("Highest Score: "+highScore, 12, 25);
  }
  
  void loadScreen()
  {
    fill(0);
    rectMode(CENTER);
    rect(0,0,width+width,height+height);
    imageMode(CENTER);
    image(logoimage, width/2,height/2-100);
    fill(255,0,0);
    textSize(30);
    text("CLICK 'ENTER KEY' TO START GAME", width/2-200,height-220);
    text("Highest Score: "+highScore, width/2+40,height-180);
    textSize(15);
    text("GAME CONTROLS:", 20,height-190);
    text("> C KEY to turn the turret right", 20,height-175);
    text("> Z KEY to turn the turret left", 20,height-160);
    text("> SPACE KEY to fire", 20,height-145);
    text("> LEFT KEY to push the plane right", 20,height-130);
    text("> RIGHT KEY to push the plane left", 20,height-115);
    textSize(16);
    text("GAME OBJECT: Keep enemy vehicles from going off-screen. If they do, you'll lose one of your 3 lives.", 20,height-95);
    text("The plane can go off-screen, but dodge carefully—getting hit costs a life.", 120,height-80);
    text("LEVELS: Destroy enemy vehicles to earn score. Reach Level 2 at score:5 and Level 3 at score:10.", 20,height-60);
    text("When your score hits 15, YOU WIN! / Lose all 3 lives, it's GAME OVER.", 75,height-45);
    textSize(20);
    text("Game by Dalex Davis/23700263", width/2-140,height-20);
  }
  
  void endScreen()
  {
    fill(0);
    rectMode(CENTER);
    rect(0,0,width+width,height+height);
    image(redskull,width/2,height/2-200, 250,250);
    fill(255,0,0);
    textSize(130);
    text("GAME OVER", width/2-320,height/2);
    textSize(50);
    text("YOUR SCORE: "+score, width/2-150,height/2+50);
    text("YOUR LEVEL: "+level, width/2-150,height/2+100);
    text("Highest Score: "+highScore, width/2-160,height/2+150);
    textSize(25);
    text("CLICK 'R KEY' TO RESTART GAME", width/2-170,height/2+250);
    textSize(20);
    text("Game by Dalex Davis/23700263", width/2-150,height-50);
  }
  
  void endScreenWon(){
    fill(0);
    rectMode(CENTER);
    rect(0,0,width+width,height+height);
    image(wintrophy,width/2,height/2-200, 200,200);
    fill(255,0,0);
    textSize(130);
    text("YOU WON", width/2-260,height/2);
    textSize(50);
    text("YOUR SCORE: "+score, width/2-150,height/2+50);
    text("YOUR LEVEL: "+level, width/2-150,height/2+100);
    text("Highest Score: "+highScore, width/2-160,height/2+150);
    textSize(25);
    text("CLICK 'R KEY' TO RESTART GAME", width/2-170,height/2+250);
    textSize(20);
    text("Game by Dalex Davis/23700263", width/2-150,height-50);
  }
  
  void gameLifeRestater(){
    if(lifeImages.isEmpty()){
      lifeImages.add(loadImage("images/heart.png"));
      lifeImages.add(loadImage("images/heart.png"));
      lifeImages.add(loadImage("images/heart.png"));
    }
  }
}
