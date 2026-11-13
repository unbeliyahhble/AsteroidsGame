class Bullet extends Floater { 
  
  private boolean isDead; 
  
  //constructor 
  public Bullet(Spaceship ship) { 
    corners = 4; 
    xCorners = new int[]{8, -5, -2, -5}; 
    yCorners = new int[]{0, 5, 0, -5}; 
    
    myColor = color(255); 
    myCenterX = ship.getCX(); 
    myCenterY = ship.getCY(); 
    myXspeed = ship.getXS(); 
    myYspeed = ship.getYS(); 
    myPointDirection = ship.getPD(); 
    
    isDead = false; 
  } 
  
  //override move 
  public void move () { 
    
    myCenterX += myXspeed; 
    myCenterY += myYspeed; 
    
    if (myCenterX > width || myCenterX < 0 || myCenterY > height || myCenterY < 0) 
      isDead = true; 
      
  } 
  
  //@override show 
  public void show () { 
    if (!isDead) {
      fill(myColor); 
      stroke(myColor); 
      ellipse((float)myCenterX, (float)myCenterY, 5.0, 5.0); 
    } 
  } 
  
  //setters 
  public void setCX(int n) { 
    myCenterX = n; 
  } 
  public void setCY(int n) { 
    myCenterY = n; 
  } 
  public void setPD(int n) { 
    myPointDirection = n; 
  } 
  public void setXS(double n) { 
    myXspeed = n; 
  } 
  public void setYS(double n) { 
    myYspeed = n; 
  } 

  //getters 
  public double getCX() { 
    return myCenterX; 
  }
  public double getCY() { 
    return myCenterY; 
  }
  public double getPD() { 
    return myPointDirection; 
  }
  public double getXS() { 
    return myXspeed; 
  }
  public double getYS() { 
    return myYspeed; 
  } 
  
} 
