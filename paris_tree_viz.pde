float theta;
int treeNumber;
Tree[] forest;

void setup() {
  size(1000, 600);
  background(255, 255, 255, 1);
  colorMode(RGB);

  treeNumber = 5;
  forest = new Tree[treeNumber];
  for (int i = 0; i < treeNumber; i++) {
    forest[i] = new Tree();
  }
}

void draw() {
  int planetSize = int(height*0.2);
  stroke(255);
  fill(39, 174, 96, 1);
  ellipse(width/2, height/2, planetSize, planetSize);

  for (int i=0; i<forest.length; i++) {
    int angle = int(i * (360/treeNumber));
    println(angle);
    pushMatrix();
    translate(width/2, height/2);
    forest[i].init(0,-planetSize/2, angle);
    popMatrix();
  }
}