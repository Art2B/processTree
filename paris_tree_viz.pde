float theta;
Tree one;
Tree two;

void setup() {
  size(1000, 600);
  background(255, 255, 255, 1);
  colorMode(RGB);
  one = new Tree();
  two = new Tree();
}

void draw() {
  int planetSize = int(height*0.2);
  pushMatrix();
  translate(width/2, height/2);
  stroke(255);
  fill(39, 174, 96, 1);
  ellipse(0, 0, planetSize, planetSize);

  int yBegin = -planetSize/2;
  one.init(0, yBegin, 0);

  popMatrix();
  translate(width/2, height/2);
  two.init(0,yBegin, 50);
}