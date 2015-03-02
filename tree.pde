class Tree {
  color trunkColor = color(83,35,27);
  color leavesColor = color(85,105,16, 20);

  void init(int xBegin, int yBegin){
    line(xBegin, yBegin, xBegin, yBegin-50);
    theta = map(width*0.3,0,width,0,PI/2); // Origin of the tree
    translate(xBegin, yBegin);
    renderBranch(60, 5);
  }

  // Create branch
  void renderBranch(float len, float strWidth) {
    stroke(trunkColor);
    strokeWeight(strWidth);
    line(0, 0, 0, -len);
    translate(0, -len);

    createLeave();

    len *= 0.66;
    strWidth *= 0.66;

    if (len > 2) {
      pushMatrix();
      rotate(theta);
      renderBranch(len, strWidth);
      popMatrix();
   
      pushMatrix();
      rotate(-theta);
      renderBranch(len, strWidth);
      popMatrix();
    }
  }
  // Add leaves
  void createLeave(){
    noStroke();
    fill(leavesColor);
    ellipse(0, 0, 10, 10);
  }
}