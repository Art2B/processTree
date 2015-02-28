float theta;

void setup() {
  size(1000,600);
  background(255, 255, 255, 1);
  colorMode(RGB);
}

void draw() {
  int planetSize = int(height*0.2);
  stroke(255);
  fill(39, 174, 96, 1);
  ellipse(width/2, height/2, planetSize, planetSize);

  int xBegin = width/2;
  int yBegin = int((height/2)-(planetSize/2));
  line(xBegin, yBegin, xBegin, yBegin-50);

  theta = map(width*0.3,0,width,0,PI/2); // Origin of the tree

  translate(xBegin, yBegin);
  branch(60, 5);
}

void branch(float len, float strWidth) {
  // Create branch
  stroke(83,35,27);
  strokeWeight(strWidth);
  line(0, 0, 0, -len);
  translate(0, -len);

  // Add Leaves
  noStroke();
  fill(85,105,16, 20);
  ellipse(0, 0, 10, 10);
 
  len *= 0.66;
  strWidth *= 0.66;

  if (len > 2) {
    pushMatrix();
    rotate(theta);
    branch(len, strWidth);
    popMatrix();
 
    pushMatrix();
    rotate(-theta);
    branch(len, strWidth);
    popMatrix();
  }
}