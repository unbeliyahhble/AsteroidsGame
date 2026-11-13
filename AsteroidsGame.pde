ArrayList <Asteroid> asteroids = new ArrayList <Asteroid> (); 
Spaceship ship = new Spaceship(); 
Star[] stars = new Star[15]; 
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
  
  for (Star s : stars) { 
    s.show(); 
    s.move(); 
  } 
  
  for (int i = 0; i < asteroids.size(); i++) { 
    
    Asteroid a = asteroids.get(i); 
    
    if (dist((float)ship.getCX(), (float)ship.getCY(), (float)a.getCX(), (float)a.getCY()) < 13) {
      asteroids.remove(i); 
    } else { 
      a.show(); 
      a.move(); 
    } 
    
  } 

  ship.show(); 
  ship.move(); 
  ship.TEMP(); 
  
} 

public void keyPressed() { 
  
  k = key; 
  
  switch (k) { 
   
    case 'a': 
      ship.turn(-5); 
      break; 
      
    case 'd': 
      ship.turn(5); 
      break; 
      
    case 'w': 
      if (ship.getXS() <= 15.0 && ship.getXS() >= -15.0) 
        ship.accelerateX(3.0); 
      if (ship.getYS() <= 15.0 && ship.getYS() >= -15.0) 
        ship.accelerateY(3.0); 
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
      if (ship.getXS() > 0) { 
        while (ship.getXS() > 0.001) 
          ship.setXS(ship.getXS() * 0.7); 
      } else if (ship.getXS() < 0) { 
        while (ship.getXS() < -0.001) 
        ship.setXS(ship.getXS() * 0.7); 
      } 
      if (ship.getYS() > 0) {
        while (ship.getYS() > 0.001) 
          ship.setYS(ship.getYS() * 0.7); 
      } else if (ship.getYS() < 0) {
        while (ship.getYS() < -0.001) 
          ship.setYS(ship.getYS() * 0.7); 
      } 
      break; 

  } 
  
} 
