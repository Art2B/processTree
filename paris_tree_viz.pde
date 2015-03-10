float theta;
int treeNumber;
Tree[] forest;
int planetSize;

// Data variables
JSONArray data;
JSONArray trees;

void setup() {
  size(1000, 600);
  background(255, 255, 255, 1);
  colorMode(RGB);

  data = loadJSONArray("data/tree_data.json");
  trees = new JSONArray();

  for (int i = 0; i < data.size(); i++) {
    if(!data.getJSONObject(i).getJSONObject("fields").hasKey("espece")){
      println("pas good");
      continue;
    }
    String espece = data.getJSONObject(i).getJSONObject("fields").getString("espece");
    boolean treeExist = false;
    int actualNumber;

    for(int j = 0; j < trees.size(); j++){
      // println(trees.getJSONObject(j).getString("name"));
      if(trees.getJSONObject(j).getString("name").equals(espece)){
        actualNumber = trees.getJSONObject(j).getInt("nbr");
        actualNumber++;
        trees.getJSONObject(j).setInt("nbr", actualNumber);
        treeExist = true;
      }
    }
    if(!treeExist){
      JSONObject newTree = new JSONObject();
      newTree.setString("name", espece);
      newTree.setInt("nbr", 1);
      trees.append(newTree);
    }
  }

  for(int i = 0; i < trees.size(); i++){
    println(trees.getJSONObject(i));
  }

  treeNumber = 1;
  forest = new Tree[treeNumber];
  for (int i = 0; i < treeNumber; i++) {
    forest[i] = new Tree();
  }
  planetSize = int(height*0.2);
}

void draw() {
  for (int i=0; i<forest.length; i++) {
    int angle = int(i * (360/treeNumber));
    pushMatrix();
    // translate(width/2, height/2);
    forest[i].init(width/2,height, angle);
    popMatrix();

    pushMatrix();
    translate(width/2, height);
    forest[i].generateLeaves(angle);
    popMatrix();
  }
}

void generatePlanet(){
  stroke(255);
  fill(39, 174, 96, 1);
  ellipse(width/2, height/2, planetSize, planetSize);
}
