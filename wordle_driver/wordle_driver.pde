Grid g;

int margin, size;
int curRow, curCol;
color green = #11ED19;

void setup() {
  size(600,600);
  size = width/12;
  margin = 10;
  curRow = curCol = 3;
  String[] text;
  
  text = loadStrings("wordle_answer_words.txt");
  //printArray(text);
  
  g = new Grid(6,5,margin);
}

void draw() {
}

void keyPressed() {
  if(key == 'd') {
    g.boxColorChange(curRow-1, curCol-1, color(green));
  }
  //print(g[curRow][curCol]);
  //curCol++;
}
