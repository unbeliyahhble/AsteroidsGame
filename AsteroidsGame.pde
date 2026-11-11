Star[] stars = new Star[15]; 
Spaceship ship = new Spaceship(); 
char k = ' '; 

public void setup() { 
  
  background(0); 
  size(400, 400); 
  noStroke(); 
  
  for (int i = 0; i < stars.length; i++) 
    stars[i] = new Star(); 
    
} 

public void draw() { 
  
  background(0); 
  
  for (Star s : stars) { 
    s.show(); 
    s.move(); 
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
        while (ship.getXS() > 0.1) 
          ship.setXS(ship.getXS() * 0.7); 
      } else if (ship.getXS() < 0) { 
        while (ship.getXS() < -0.1) 
        ship.setXS(ship.getXS() * 0.7); 
      } 
      if (ship.getYS() > 0) {
        while (ship.getYS() > 0.1) 
          ship.setYS(ship.getYS() * 0.7); 
      } else if (ship.getYS() < 0) {
        while (ship.getYS() < -0.1) 
          ship.setYS(ship.getYS() * 0.7); 
      } 
      break; 
      
    case 'd': 
      System.out.println("d released"); 
      break; 
      
    case 'a': 
      System.out.println("a released"); 
      break; 
      
  } 
  
} 
