void setup() {
  size(1000,600);
  background(255, 255, 255, 1);
}

void draw() {
  // noStroke();
  ellipse(width/2, height/2, height*0.2, height*0.2);
  fill(39, 174, 96,1.0);

  int xBegin = width/2;
  int yBegin = int((height/2)-(height*0.1));
  line(xBegin, yBegin, xBegin, yBegin-50);
}