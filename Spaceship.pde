class Spaceship extends Floater { 
  
  protected int health; 
  protected int hitBox; 
  
  //constructor 
  public Spaceship() { 
    corners = 4; 
    xCorners = new int[]{8, -5, -2, -5}; 
    yCorners = new int[]{0, 5, 0, -5}; 
    myColor = color(255); 
    myCenterX = 200; 
    myCenterY = 200; 
    myXspeed = myYspeed = 0; 
    myPointDirection = 0; 
    health = 10; 
    hitBox = 9; 
  } 
  
  //constructor 2 
  public Spaceship(int h) { 
    corners = 4; 
    xCorners = new int[]{8, -5, -2, -5}; 
    yCorners = new int[]{0, 5, 0, -5}; 
    myColor = color(255); 
    myCenterX = 200; 
    myCenterY = 200; 
    myXspeed = myYspeed = 0; 
    myPointDirection = 0; 
    health = h; 
    hitBox = 9; 
  } 
  
  //hyperspace 
  public void hyperSpace() {
    myCenterX = (int)(Math.random()*400); 
    myCenterY = (int)(Math.random()*400); 
    myXspeed = myYspeed = 0; 
    myPointDirection = (int)(Math.random()*360); 
  } 
  
  //accelerate x only 
  public void accelerateX (double dAmount) { 
    double dRadians = myPointDirection*(Math.PI/180); 
    myXspeed += ((dAmount) * Math.cos(dRadians)); 
  } 
  
  //accelerate y only 
  public void accelerateY (double dAmount) { 
    double dRadians = myPointDirection*(Math.PI/180); 
    myYspeed += ((dAmount) * Math.sin(dRadians)); 
  } 
  
  //show info 
  public void showShipInfo() { 
    PFont f = createFont("Consolas", 32);
    textFont(f); 
    fill(255); 
    textAlign(LEFT); 
    textSize(12); 
    text("health: " + health, 5, 15); 
    text("center: (" + round((float)myCenterX) + "," + round((float)myCenterY) + ")", 5, 395); 
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
  public void setH(int n) { 
    health = n; 
  } 
  public void setHB(int n) {
    hitBox = n; 
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
  public int getH() { 
    return health; 
  } 
  public int getHB() {
    return hitBox; 
  } 
  
} 
