float theta;
int treeNumber;
Tree[] forest;
int planetSize;

void setup() {
  size(1000, 600);
  background(255, 255, 255, 1);
  colorMode(RGB);

  treeNumber = 7;
  forest = new Tree[treeNumber];
  for (int i = 0; i < treeNumber; i++) {
    forest[i] = new Tree();
  }
  planetSize = int(height*0.2);
}

void draw() {
  generatePlanet();

  for (int i=0; i<forest.length; i++) {
    int angle = int(i * (360/treeNumber));
    pushMatrix();
    translate(width/2, height/2);
    forest[i].init(0,-planetSize/2, angle);
    popMatrix();
  }
}

void generatePlanet(){
  stroke(255);
  fill(39, 174, 96, 1);
  ellipse(width/2, height/2, planetSize, planetSize);
}