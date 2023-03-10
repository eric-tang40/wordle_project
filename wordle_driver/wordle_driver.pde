Grid g;

int margin, size;
int curRow, curCol;

void setup() {
  size(600,600);
  size = width/12;
  margin = 10;
  String[] text;
  
  text = loadStrings("wordle_answer_words.txt");
  //printArray(text);
  
  g = new Grid(6,5,margin);
}

void draw() {
}

void keyPressed() {
  
  print(g[curRow][curCol]);
  curCol++;
}
