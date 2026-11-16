class Asteroid extends Floater { 
  
  protected double myRotationSpeed; 
  protected int size; 
  protected int hitBox; 
  
  //constructor 
  public Asteroid() { 
    corners = (int)(Math.random()*2)+11; 
    size = (int)(Math.random()*3)+1; 
    setHitBox(); 
    setXYCorners(); 
    myColor = color(255, 255, 255); 
    myCenterX = ((int)(Math.random()*2) == 0) ? (int)(Math.random()*150) : ((int)(Math.random()*150)+250); 
    myCenterY = ((int)(Math.random()*2) == 0) ? (int)(Math.random()*150) : ((int)(Math.random()*150)+250); 
    myXspeed = Math.random()*3-1; 
    myYspeed = Math.random()*3-1; 
    myPointDirection = Math.random()*360; 
    myRotationSpeed = Math.random()*3-1; 
  } 
  
  //@override move 
  public void move () { 
    
    turn(myRotationSpeed); 
    super.move(); 
    
    myCenterX += myXspeed; 
    myCenterY += myYspeed; 
    
    //wrap around screen 
    if (myCenterX > width)   
      myCenterX = 0; 
    else if (myCenterX < 0) 
      myCenterX = width; 
    if (myCenterY > height) 
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
  public void setRS(double n) {
    myRotationSpeed = n; 
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
  public double getRS() {
    return myRotationSpeed; 
  } 
  public int getHB() {
    return hitBox; 
  } 
  
  private void setXYCorners() { 
    
    int[] xA; 
    int[] yA; 
      
    switch (corners) { 
      
      case 11: //hitBox = 7, 27, 57 
        xA = new int[]{-2, -3, 0, 0, 1, 3, 2, -2, -4, -5, -4}; 
        yA = new int[]{2, 5, 5, 3, 5, 2, -1, -2, 0, 2, 3}; 
        xCorners = loopScale(xA, size+1); 
        yCorners = loopScale(yA, size+1); 
        break; 
        
      case 12: //hitBox = 8, 28, 58 
        xA = new int[]{-5, -3, 0, 2, 4, 3, 5, 2, 0, -2, -4, -3}; //first 0 = bottom @ PD = 0 
        yA = new int[]{3, 5, 4, 5, 3, 2, 0, -2, -2, -3, 0, 2}; 
        xCorners = loopScale(xA, size+1); 
        yCorners = loopScale(yA, size+1); 
        break; 
    
    } 
     
  } 
  
  private int[] loopScale(int[] x, int scale) { 
    int[] arr = new int[x.length]; 
    for (int i = 0; i < x.length; i++) 
      arr[i] = x[i] * scale; 
    return arr; 
  } 
  
  private void setHitBox() {
    
    int base = 0; 
    
    switch (corners) {
      
      case 11: 
        base = 7; 
        break; 
        
      case 12: 
        base = 8; 
        break; 
      
    } 
    
    switch (size) {
      
      case 1: 
        hitBox = base; 
        break; 
        
      default: 
        hitBox = base + (size * 5); 
        break; 
      
    } 
    
  } 
  
} 
