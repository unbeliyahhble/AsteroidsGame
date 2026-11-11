class Star { 
  
  private int myX, myY, c, s; 
  
  //constructor 
  public Star () { 
    myX = (int)(Math.random()*400); 
    myY = (int)(Math.random()*400); 
    c = (int)(Math.random()*100)+250; //colour 
    s = (int)(Math.random()*2); //size 
  } 
  
  //show star 
  public void show() { 
    drawLight(myX, myY, c, s); 
  } 
  
  //move star 
  public void move() {
    myX = myX + (int)(Math.random()*3)-1; 
    myY = myY + (int)(Math.random()*3)-1; 
  } 
  
  //draw circle 
  private void drawLight(int x, int y, int c, int s) { 
    noStroke(); 
    fill(250, 250, c+50, 60); 
    ellipse(x, y, s+10, s+10); 
    fill(250, 250, c+100, 90); 
    ellipse(x, y, s+5, s+5); 
    fill(250, 250, c+150, 90); 
    ellipse(x, y, s+1, s+1); 
    fill(255, 255, 255); 
    ellipse(x, y, s, s); 
  } 
  
} 
