private double fractionLength = 0.7; 
private int smallestBranch = 10; 
private double branchAngle = 0.2;  
public void setup() 
{   
  size(500,500);   
  noLoop();
} 
public void draw() 
{   
  background(0);   
  stroke((int)(Math.random() * 255), (int)(Math.random() * 255), (int)(Math.random() * 255));   
  line(250,500,250,400);   
  drawBranches(250, 400, 100, 3*Math.PI/2);
  //fractionLength+= 0.0004;
  //branchAngle += .0002;
  noStroke();
  fill(100, 200, 130);
  rect(0, 470, 500, 30);  
}


public void keyPressed() {
  if(key == 'g' || key == 'G') {
      fractionLength += 0.005;
      branchAngle += .001;
      redraw();
    } 
    if (key == 's' || key == 'S') {
      fractionLength -= 0.005;
      branchAngle -= .001;
      redraw();
    }
/*
  fractionLength+= 0.002;
  branchAngle += .001;
  redraw();
  */
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
  fill(255);
  ellipse(endX1, endY1, 2, 2);
  ellipse(endX2, endY2, 2, 2);
  
  if(branchLength > smallestBranch) {   
    drawBranches(endX1, endY1, branchLength, angle1);
    drawBranches(endX2, endY2, branchLength, angle2);
  }
  //System.out.println(branchLength);
} 
