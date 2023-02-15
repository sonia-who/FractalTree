private double fractionLength = 0.99; 
private int smallestBranch = 1; 
private double branchAngle = 0.2;  
public void setup() 
{   
  size(500,500);    
  noLoop(); 
} 
public void draw() 
{   
  background(0);   
  stroke(0,255,0);   
  line(250,500,250,400);   
  drawBranches(250, 400, 100, 3*Math.PI/2);
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
  double angle1 = angle + branchAngle;
  double angle2 = angle - branchAngle;
  
  branchLength *= fractionLength;
  
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);;
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);
    
  line(x, y, endX1, endY1);
  line(x, y, endX2, endY2);
  
  if(branchLength > smallestBranch) {   
    drawBranches(endX1, endY1, fractionLength/2, angle1);
    drawBranches(endX2, endY2, fractionLength/2, angle2);
  }
} 
