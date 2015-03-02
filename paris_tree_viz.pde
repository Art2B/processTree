float theta;
Tree t;

void setup() {
  size(1000, 600);
  background(255, 255, 255, 1);
  colorMode(RGB);
  t = new Tree();
}

void draw() {
  int planetSize = int(height*0.2);
  stroke(255);
  fill(39, 174, 96, 1);
  ellipse(width/2, height/2, planetSize, planetSize);

  int xBegin = width/2;
  int yBegin = int((height/2)-(planetSize/2));
  t.init(xBegin, yBegin);
}