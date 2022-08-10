// Langtons Ant json editor

LangtonsAnt board1;

ArrayList<LangtonsAnt> antBoards = new ArrayList<LangtonsAnt>();

// for mouse click
int newBoardSize = 9;

// Objects can be added to an ArrayList with add()
// particles.add(new Particle());
boolean strokes = false;
long lastTime = 0;
long timeLimit = 250;

JSONObject json;

void loadData() {
  json = loadJSONObject("layout.json");

  // JSONArray boards = json.getJSONArray("boards");
  // JSONObject board = boards.getJSONObject(0);
  // print(board.getInt("id"));
  print("loaded json");

}
void loadBoards() {
  int cell_size = json.getInt("cell_size");
  JSONArray boards = json.getJSONArray("boards");

  // Go through json object and create ca's from it
  for(int i=0; i < boards.size(); i ++) {
    JSONObject board = boards.getJSONObject(i);
    int x = board.getInt("x");
    int y = board.getInt("y");
    int width = board.getInt("width");
    int height = board.getInt("height");
    print(x);

    antBoards.add(new LangtonsAnt(x,y,width,height,cell_size));
  }
  

}

void setup() {
  //frameRate(30);
  noStroke();
  size(800,800);
  loadData();
  loadBoards();
  
  // //top
  // antBoards.add(new LangtonsAnt(60,0, 5, 60));
  
  // //left
  // antBoards.add(new LangtonsAnt(0,60, 20, 5));
  // antBoards.add(new LangtonsAnt(0,270, 40, 5));
  
  // //bottom
  // antBoards.add(new LangtonsAnt(0,700, 8, 70));
  
  // //right
  // antBoards.add(new LangtonsAnt(770,60, 20, 3));
  // antBoards.add(new LangtonsAnt(770,270, 40, 3));
  /*
  int cols = 24;
  int rows = 24;
  int size = 1;
  for  (int i = 0; i < cols; i ++) {
   for (int j = 0; j < rows; j ++) {
     // create board
     //antBoards.add(new LangtonsAnt(ceil((10+random(600)) / 10) * 10, ceil((10+random(600)) / 10) * 10, newBoardSize, newBoardSize));
     int x = i * 50;
     int y = j * 50;
     antBoards.add(new LangtonsAnt(x,y,size+i,size+j,2));
   }
  }
  */
 

  
 
}
void draw() {
  // call object
  background(232);
  fill(0);
  for(LangtonsAnt ant : antBoards) {
    ant.updateAndDraw();
  }
  //board1.updateAndDraw();
  //board2.updateAndDraw();
  //board3.updateAndDraw();
  noFill();
  stroke(2);
  rect((mouseX / 10) * 10, (mouseY / 10) * 10, newBoardSize * 10,newBoardSize * 10);
  if(strokes) {
    stroke(2);
  } else {
    noStroke();
  }
  if(millis() - lastTime > timeLimit) {
    //antBoards.add(new LangtonsAnt(ceil((10+random(600)) / 10) * 10, ceil((10+random(600)) / 10) * 10, newBoardSize, newBoardSize));
    //newBoardSize = ceil(random(20));
    //if(antBoards.size() > 140) {
    //  antBoards.remove(ceil(random(32)));
    //}
    lastTime = millis();
  }
  //noStroke();
}

void mouseClicked() {
  
  antBoards.add(new LangtonsAnt((mouseX / 10) * 10, (mouseY / 10) * 10, newBoardSize, newBoardSize, 10));
  newBoardSize = ceil(random(30));
}

void keyPressed() {
  if (key == 'a') {
    strokes = !strokes;
    for(LangtonsAnt ant : antBoards) {
      ant.setStroke(strokes);
    }
    print("a");
    
  }
}
