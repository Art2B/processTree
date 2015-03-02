class Tree {
 
  void init(int xBegin, int yBegin){
    line(xBegin, yBegin, xBegin, yBegin-50);
    theta = map(width*0.3,0,width,0,PI/2); // Origin of the tree
    translate(xBegin, yBegin);
    branch(60, 5);
  }

  // Create branch and leaves for tree
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
}