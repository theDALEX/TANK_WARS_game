PImage bg;
Tankplayer tank;
Userinterface ui;
ArrayList<BaseEnemy> enemies = new ArrayList<BaseEnemy>(); // Polymorphic Array
ArrayList<EnemyFly> flyingEnemies = new ArrayList<EnemyFly>();
int backgroundSpeed = 2;
int bgY = 0;
int rotationmove = 5;// to control the turret swing speed
int lastAddedTime, addInterval;
int lastAddedTimeForfly = 5000, addIntervalForfly;//initial 5sec interval for enemies
int gameMode = 0;
int flyingEnemyX;

String filePath;
String[] lines;
int highscore;

void setup() {
  size(700, 700);
  bg = loadImage("images/background.jpeg");
  filePath = "HighScoreFile.txt";
  String[] lines = loadStrings(filePath);
  highscore = int(lines[0]);
  tank = new Tankplayer(0);
  ui = new Userinterface(tank.score, highscore);
}

void draw() {
  ui.loadScreen();
  switch(gameMode){
    case 1:
      displayBackground();
      tank.display();
      tank.gunrender();
      spawnEnemies(); // Using the polymorphic array
      displayEnemies(); // Using the polymorphic array
      flyingEnemiesSpawn();
      flyingEnemiesDisplay();    
      ui.score = tank.score; // Update the score in the UI
      ui.uiRendering();
      levelUp();
      highScoreModifier();
      
      if(ui.lifeImages.isEmpty()){
        gameMode = 3;
      }
      else if(ui.score ==15){
        gameMode = 2;
      }
      break;
   case 2:
     ui.endScreenWon();
     break;
   case 3:
     ui.endScreen();
     break;
  }
}

void displayBackground(){
  imageMode(CORNER);
  background(255);
  image(bg, 0, bgY);
  image(bg, 0, bgY - height);
  if (bgY >= height) {
    bgY = 0;
  }
  bgY += backgroundSpeed;
}

void spawnEnemies(){
  if (millis() - lastAddedTime >= addInterval) {
    int x = random(1) > 0.5 ? int(random(30, width / 2 - 80)) : int(random(width / 2 + 80, width - 30));
    BaseEnemy enemy = random(1) > 0.5 ? new EnemyType1(x) : new EnemyType2(x); // Polymorphic behavior with different speeds
    enemies.add(enemy); // Adding to polymorphic array
    lastAddedTime = millis();
    
    switch(ui.level){
      case 1:
        addInterval = int(random(5000, 10000)); // Random interval between 5 and 10 seconds for Level 1.
        break;
      case 2:
        addInterval = int(random(3000, 5000)); // Random interval between 3 and 5 seconds for Level 2.
        break;
      case 3:
        addInterval = int(random(1000, 3000)); // Random interval between 1 and 3 seconds for Level 3.
        break;
    }
  }
}

void displayEnemies(){
  for(int i = enemies.size() - 1; i >= 0; i--){
    BaseEnemy enemy = enemies.get(i);
    enemy.update();
    enemy.display();
    if (enemy.isOffScreen()){
      enemies.remove(i);
      if(enemy.isOffScreen() && !enemy.exploded)
      {
        ui.removeLife();
      }
    }
  }
}

void flyingEnemiesSpawn(){
  if (millis() - lastAddedTimeForfly >= addIntervalForfly) {
    flyingEnemyX = width/2;
    EnemyFly flyenemy = new EnemyFly(flyingEnemyX);
    flyingEnemies.add(flyenemy);
    lastAddedTimeForfly = millis();
    addIntervalForfly = int(random(6000, 10000)); // Random interval between 5 and 8 seconds
  }
}

void flyingEnemiesDisplay() {
  for (int i = flyingEnemies.size() - 1; i >= 0; i--) { // Start from the last index
    EnemyFly flyenemy = flyingEnemies.get(i);
    flyenemy.update();
    flyenemy.display();

    if(flyenemy.collidesWith(tank)){
      flyenemy.explode();
    }
    
    if(flyenemy.exploded && flyenemy.y == height/2){
      flyingEnemies.remove(i);
      ui.removeLife();
    }
    
    if(flyenemy.isOffScreen()){
      flyingEnemies.remove(i);
    }
  }
}

void levelUp(){
  //Level selector, to reach level 2 the player needs a score of greater than 5.
  if(ui.score>=5 && ui.level == 1){
    ui.level += 1;
  }
  //to reach level 3 the player needs a score of greater than 10.
  else if(ui.score>=10 && ui.level == 2){
    ui.level += 1;
  }
}

void highScoreModifier(){
  if(highscore<tank.score){
    highscore -= highscore;
    highscore += tank.score;
    // Write the modified number back to the file 
    saveStrings(filePath, new String[] {str(highscore)});
  }
}

void keyPressed(){
  if (key == 'z' || key == 'Z'){
    tank.swing -= rotationmove;
  }
  else if (key == 'c' || key == 'C'){
    tank.swing += rotationmove;
  }
  else if (keyCode == ENTER){
    gameMode = 1;
  }
  else if(key == 'r' || key == 'R'){
    if(ui.lifeImages.isEmpty()){
      ui.level = 1;
      ui.gameLifeRestater();
      tank.score = 0;
    }
    else if(tank.score == 15 && key =='r'){
      ui.level = 1;
      tank.score = 0;
    }
    enemies.clear();
    flyingEnemies.clear();
    gameMode = 1;
  }
  
  else if(keyCode == RIGHT){ 
    for(EnemyFly en : flyingEnemies){
      en.move(-200);
    } 
  }
  else if(keyCode == LEFT){ 
    for(EnemyFly en : flyingEnemies){
      en.move(200);
    } 
  }
}

void keyReleased(){
  if (key == ' '){
    tank.fire();
  }
}
