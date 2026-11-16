final int NUM_ASTEROIDS = 15; 
final int MAX_BULLETS = 25; 
final int MAX_HEALTH = 10; 
final int NUM_STARS = 10; 

int numBulletsUsed = 0; 
int numAsteroids = NUM_ASTEROIDS; 
int numPoints = 0; 

// TO DO: 
  // oddball --> double points 
  // count time --> exeeding certain threshold = bonus points or lives 

ArrayList <Asteroid> asteroids = new ArrayList <Asteroid> (); 
ArrayList <Bullet> bullets = new ArrayList <Bullet> (); 
Spaceship ship = new Spaceship(MAX_HEALTH); 
Star[] stars = new Star[NUM_STARS]; 

char k = ' '; 
int gameState = 0; //0 = start, 1 = play, 2 = win, -1 = lose 

public void setup() { 
  size(400, 400); 
  background(0); 
  noStroke(); 
  
  PFont f = createFont("Consolas", 32);
  textFont(f); 
  
  for (int i = 0; i < NUM_STARS; i++) 
    stars[i] = new Star(); 
  for (int i = 0; i < NUM_ASTEROIDS; i++) 
    asteroids.add(new Asteroid()); 
} 

public void draw() { 
  
  background(0); 
  
  switch (gameState) { 
    
    case 0: 
      drawStartScreen(); 
      break; 
    
    case 1:     
      textAlign(LEFT, BASELINE); 
      textSize(12); 
  
      bullets.forEach(b -> {
        b.show(); b.move();
      }); 
    
      for (Star s : stars) { 
        s.show(); 
        s.move(); 
      } 
    
      for (int i = 0; i < asteroids.size(); i++) { 
        
        Asteroid a = asteroids.get(i); 
        
        for (int j = 0; j < bullets.size(); j++) { 
          
          Bullet b = bullets.get(j); 
          
          float aMargin = a.getHB(); 
          
          if (dist((float)a.getCX(), (float)a.getCY(), (float)b.getCX(), (float)b.getCY()) < aMargin) { 
            asteroids.remove(i); 
            numAsteroids--; 
            numPoints++; 
            i--; 
            bullets.remove(j); 
            j--; 
            break; 
          } 
          
        } 
        
        float aMargin = a.getHB(); 
        float sMargin = ship.getHB(); 
        float margin = (sMargin >= aMargin) ? sMargin : aMargin; 
      
        if (dist((float)ship.getCX(), (float)ship.getCY(), (float)a.getCX(), (float)a.getCY()) < margin) {
          asteroids.remove(i); 
          ship.setH(ship.getH()-1); 
          numAsteroids--; 
          i--; 
        } else { 
          a.show(); 
          a.move(); 
        } 
      
      } 
  
      ship.show(); 
      ship.move(); 
      
      ship.showShipInfo(); 
      text("bullets: " + (MAX_BULLETS - numBulletsUsed), 5, 25); 
      text("asteroids left: " + numAsteroids, 5, 35); 
      text("points: " + numPoints, 5, 45); 
      
      if (asteroids.size() == 0) { 
        if (ship.getH() > 0) 
          gameState = 2; 
        else 
          gameState = -1; 
      } else if (ship.getH() == 0) { 
        gameState = -1; 
      } 
      break; 
      
    case 2: 
      drawFinalScreen(); 
      break; 
    
    case -1: 
      drawFinalScreen(); 
      break; 
    
  } 
  
} 

public void keyPressed() { 
  
  k = key; 
  
  switch (k) { 
   
    case 'a': 
      ship.turn(-15); 
      break; 
      
    case 'd': 
      ship.turn(15); 
      break; 
      
    case 'w': 
      float cap = 15.0; 
      float acc = 5.0; 
      if (ship.getXS() <= cap && ship.getXS() >= -(cap)) 
        ship.accelerateX(acc); 
      if (ship.getYS() <= cap && ship.getYS() >= -(cap)) 
        ship.accelerateY(acc); 
      break; 
    
    case 'h': 
      ship.hyperSpace(); 
      break; 
    
  } 
  
} 

public void keyReleased() { 
  
  char p = k; 
  k = ' '; 
  
  switch (p) { 
    
    case 'w': 
      float cap = 0.0001; 
      float dec = 0.98; 
      if (ship.getXS() > 0) { 
        while (ship.getXS() > cap) 
          ship.setXS(ship.getXS() * dec); 
      } else if (ship.getXS() < 0) { 
        while (ship.getXS() < -(cap)) 
        ship.setXS(ship.getXS() * dec); 
      } 
      if (ship.getYS() > 0) {
        while (ship.getYS() > cap) 
          ship.setYS(ship.getYS() * dec); 
      } else if (ship.getYS() < 0) {
        while (ship.getYS() < -(cap)) 
          ship.setYS(ship.getYS() * dec); 
      } 
      break; 
      
    case 's': 
      if (numBulletsUsed < MAX_BULLETS) {
        Bullet b = new Bullet(ship); 
        b.accelerate(6.0); 
        bullets.add(b); 
        numBulletsUsed++; 
      } 
      break; 
      
    case ' ': 
      if (gameState == 0) {
        gameState = 1; 
      } 
      break; 
   
  } 
  
} 

public void drawStartScreen() {
  background(0); 
  textAlign(CENTER, CENTER); 
  textSize(40); 
  text("asteroids", 200, 200); 
  
  textAlign(CENTER, CENTER); 
  textSize(12); 
  text("press space to start", 200, 230); 
} 

public void drawFinalScreen() { 
  background(0); 
  textAlign(CENTER, CENTER); 
  textSize(40); 
  if (gameState == 2) 
    text("you win!", 200, 200); 
  else if (gameState == -1) 
    text("you lose!", 200, 200); 
  
  textAlign(CENTER, CENTER); 
  textSize(12); 
  text("health: " + ship.getH(), 200, 230); 
  text("# asteroids left: " + numAsteroids, 200, 240); 
  text("# bullets left: " + (MAX_BULLETS - numBulletsUsed), 200, 250); 
} 
