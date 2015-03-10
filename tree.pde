class Tree {
  color trunkColor = color(83,35,27);
  boolean hasLeaves = false;

  void init(int xBegin, int yBegin, int angle){
    float rotateRadians = radians(angle);
    rotate(rotateRadians);
    line(xBegin, yBegin, xBegin, yBegin-50);
    theta = map(width*0.3,0,width,0,PI/2);
    translate(xBegin, yBegin);
    renderBranch(60, 5);
  }

  // Create branch
  void renderBranch(float len, float strWidth) {
    if(!hasLeaves){
      stroke(trunkColor);
      strokeWeight(strWidth);
      line(0, 0, 0, -len);
      translate(0, -len);

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
  }
  void generateLeaves(int angle){
    if(!hasLeaves){
      translate(width/2, height/2);
      float rotateRadians = radians(angle);
      rotate(rotateRadians);
      translate(0, -200);

      hasLeaves = true;
      for (int i = 0; i < 500; ++i) {
        float numX = randomGaussian();
        float numY = randomGaussian();
        float sdX = 40;
        float sdY = 20;
        float mean = 0;

        float x = (sdX * numX) -15;
        float y = (sdY * numY) + mean;
        noStroke();
        fill(getLeaveColor());
        ellipse(x, y, 16, 16);
      }
    }
  }
  color getLeaveColor(){
    float sd = 20;
    float redMean = 85;
    float greenMean = 105;
    float blueMean = 16;

    float red = (sd* randomGaussian()) + redMean;
    float green = (sd* randomGaussian()) + greenMean;
    float blue = (sd* randomGaussian()) + blueMean;

    color leaveColor = color(red, green, blue, 200);

    return leaveColor;
  }
}