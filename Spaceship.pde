class Spaceship extends Floater { 
  
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
  
  //show ref vars 
  public void TEMP() { 
    fill(255); 
    text("center x: " + round((float)myCenterX), 5, 15); 
    text("center y: " + round((float)myCenterY), 5, 25); 
    text("speed x: " + myXspeed, 5, 35); 
    text("speed y: " + myYspeed, 5, 45); 
    text("rotation: " + myPointDirection, 5, 55); 
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
