JSONArray data;
JSONArray trees;
JSONObject[] filteredTrees;

void setup() {
  size(1000, 1000);
  background(255, 255, 255, 1);
  colorMode(RGB);

  data = loadJSONArray("http://opendata.paris.fr/explore/dataset/les-arbres/download/?format=json&timezone=Europe/Berlin");
  trees = filterBySpecie(data);
  filteredTrees = new JSONObject[5];

  int[] minRanges = new int[5];
  minRanges[0] = 0;
  minRanges[1] = 10;
  minRanges[2] = 100;
  minRanges[3] = 1000;
  minRanges[4] = 5000;
  int[] maxRanges = new int[5];
  maxRanges[0] = 10;
  maxRanges[1] = 100;
  maxRanges[2] = 1000;
  maxRanges[3] = 5000;
  maxRanges[4] = 100000;

  for(int i=0; i<filteredTrees.length; i++){
    int minRange = minRanges[i];
    int maxRange = maxRanges[i];
    filteredTrees[i] = filterByRange(trees, minRange, maxRange);
  }
}

void draw() {
  background(255, 255, 255);
  noFill();
  strokeCap(SQUARE);
  smooth();

  int ellipseSize = 200;
  int strokeSize = 60;

  for(int j=0; j<filteredTrees.length; j++){
    strokeWeight(strokeSize);
    float rad = 0;
    for(int i =0; i < filteredTrees[j].getJSONArray("trees").size(); i++){
      JSONObject element = filteredTrees[j].getJSONArray("trees").getJSONObject(i);
      float radBegin = rad;
      rad += ((float(element.getInt("nbr"))/filteredTrees[j].getInt("rangeNbr"))*(2*PI)) ;
      color strokeColor = color(element.getJSONObject("color").getFloat("red"), element.getJSONObject("color").getFloat("green"), element.getJSONObject("color").getFloat("blue"));
      stroke(strokeColor);
      arc(width/2, height/2, ellipseSize, ellipseSize, radBegin, rad);
    }
    ellipseSize += (strokeSize*2);
    strokeSize *= 0.9;
  }
}

JSONArray filterBySpecie(JSONArray data){
  JSONArray trees = new JSONArray();
  for (int i = 0; i < data.size(); i++) {
    if(!data.getJSONObject(i).getJSONObject("fields").hasKey("espece")){
      continue;
    }

    String specie = data.getJSONObject(i).getJSONObject("fields").getString("espece").split(" ", 2)[0];
    boolean treeExist = false;
    int actualNumber;

    for(int j = 0; j < trees.size(); j++){
      if(trees.getJSONObject(j).getString("name").equals(specie)){
        actualNumber = trees.getJSONObject(j).getInt("nbr");
        actualNumber++;
        trees.getJSONObject(j).setInt("nbr", actualNumber);
        treeExist = true;
      }
    }
    if(!treeExist){
      JSONObject newTree = new JSONObject();
      newTree.setString("name", specie);
      newTree.setInt("nbr", 1);
      trees.append(newTree);
    }
  }
  return trees;
}

JSONObject filterByRange(JSONArray data, int minRange, int maxRange){
  JSONObject trees = new JSONObject();
  JSONArray tempTrees = new JSONArray();
  int rangeNbr = 0;
  for(int i = 0; i < data.size(); i++){
    if(data.getJSONObject(i).getInt("nbr") > minRange && data.getJSONObject(i).getInt("nbr") < maxRange){
      tempTrees.append(data.getJSONObject(i));
      rangeNbr += data.getJSONObject(i).getInt("nbr");
    }
  }
  for(int i = 0; i < tempTrees.size(); i++){
    tempTrees.getJSONObject(i).setJSONObject("color", getColor());
  }
  trees.setInt("rangeNbr", rangeNbr);
  trees.setJSONArray("trees", tempTrees);
  return trees;
}

JSONObject getColor(){
  float sd = 20;
  float redMean = 85;
  float greenMean = 105;
  float blueMean = 16;

  float red = (sd* randomGaussian()) + redMean;
  float green = (sd* randomGaussian()) + greenMean;
  float blue = (sd* randomGaussian()) + blueMean;

  JSONObject colorObject = new JSONObject();
  colorObject.setFloat("red", red);
  colorObject.setFloat("green", green);
  colorObject.setFloat("blue", blue);

  return colorObject;
}
