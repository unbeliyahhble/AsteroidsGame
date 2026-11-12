class Asteroid extends Floater { 
  
  protected double rotationSpeed; 
  
  //constructor 
  public Asteroid() { 
    corners = 4; 
    xCorners = new int[]{8, 10, -2, -5}; 
    yCorners = new int[]{0, 5, 3, -5}; 
    
    myColor = color(255, 255, 255); 
    myCenterX = (int)(Math.random()*400); 
    myCenterY = (int)(Math.random()*400); 
    myXspeed = Math.random()*3-1; 
    myYspeed = Math.random()*3-1; 
    myPointDirection = Math.random()*360; 
    rotationSpeed = Math.random()*3-1; 
  } 
  
  //@override move 
  public void move () { 
    
    turn(rotationSpeed); 
    super.move(); 
    
    myCenterX += myXspeed; 
    myCenterY += myYspeed; 
    
    //wrap around screen 
    if(myCenterX > width)   
      myCenterX = 0; 
    else if (myCenterX < 0) 
      myCenterX = width; 
    if(myCenterY > height) 
      myCenterY = 0; 
    else if (myCenterY < 0) 
      myCenterY = height; 
    
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
  public void setRotationSpeed(double n) {
    rotationSpeed = n; 
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
  public double getRotationSpeed() {
    return rotationSpeed; 
  } 
  
} 
