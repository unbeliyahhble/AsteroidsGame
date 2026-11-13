//to do: 
//  - different size asteroids 
//  - health 
//  - point system 
//  - win/lose 
//  - start/win/lose screen 
//  - asteroids split 

ArrayList<Asteroid> asteroids = new ArrayList<Asteroid>(); 
ArrayList<Bullet> bullets = new ArrayList<Bullet>(); 
Spaceship ship = new Spaceship(); 
Star[] stars = new Star[15]; 

int gameState = 0; 
char k = ' '; 

public void setup() { 
  size(400, 400); 
  background(0); 
  noStroke(); 
  for (int i = 0; i < stars.length; i++) 
    stars[i] = new Star(); 
  for (int i = 0; i < 10; i++) 
    asteroids.add(new Asteroid()); 
} 

public void draw() { 
  
  background(0); 
  
  if (asteroids.size() == 0) {
    gameState = 1; 
  } else if (ship.getHealth() == 0) {
    gameState = -1; 
  } 
  
  bullets.forEach(b -> {b.show(); b.move();}); 
  
  for (Star s : stars) { 
    s.show(); 
    s.move(); 
  } 
  
  for (int i = 0; i < asteroids.size(); i++) { 
    
    Asteroid a = asteroids.get(i); 
    
    for (int j = 0; j < bullets.size(); j++) { 
      
      Bullet b = bullets.get(j); 
      
      if (dist((float)a.getCX(), (float)a.getCY(), (float)b.getCX(), (float)b.getCY()) < 13) {
        asteroids.remove(i); 
        i--; 
        bullets.remove(j); 
        j--; 
        break; 
      } 
      
    } 
    
    if (dist((float)ship.getCX(), (float)ship.getCY(), (float)a.getCX(), (float)a.getCY()) < 13) {
      asteroids.remove(i); 
      i--; 
      ship.setHealth(ship.getHealth()-1); 
    } else { 
      a.show(); 
      a.move(); 
    } 
    
  } 

  ship.show(); 
  ship.move(); 
  ship.showShipInfo(); 
  
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
      Bullet b = new Bullet(ship); 
      b.accelerate(6.0); 
      bullets.add(b); 
      break; 
      
  } 
  
} 
