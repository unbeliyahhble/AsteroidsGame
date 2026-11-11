class Floater { 
  
  protected int corners; 
  protected int[] xCorners; 
  protected int[] yCorners; 
  protected int myColor; 
  protected double myCenterX, myCenterY; //holds center coordinates 
  protected double myXspeed, myYspeed; //holds the speed of travel in the x and y directions 
  protected double myPointDirection; //holds current direction the ship is pointing in degrees 

  //accelerates the floater in myPointDirection 
  public void accelerate (double dAmount) { 
    double dRadians = myPointDirection*(Math.PI/180); 
    myXspeed += ((dAmount) * Math.cos(dRadians)); 
    myYspeed += ((dAmount) * Math.sin(dRadians)); 
  } 
  
  //rotates the floater by degreesOfRotation 
  public void turn (double degreesOfRotation) { 
    myPointDirection += degreesOfRotation; 
  } 
  
  //moves the floater in the current direction of travel 
  public void move () { 
    
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
  
  //draws floater 
  public void show () { 
    
    fill(0); 
    stroke(myColor); 
    
    //translate the (x,y) center of the ship to the correct position 
    translate((float)myCenterX, (float)myCenterY);

    //convert degrees to radians for rotate() 
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    
    //rotate so that the polygon will be drawn in the correct direction 
    rotate(dRadians); 
    
    //draw the polygon 
    beginShape(); 
    for (int nI = 0; nI < corners; nI++) 
      vertex(xCorners[nI], yCorners[nI]); 
    endShape(CLOSE); 

    //"unrotate" and "untranslate" 
    rotate(-1*dRadians); 
    translate(-1*(float)myCenterX, -1*(float)myCenterY); 
    
  } 
  
} 
