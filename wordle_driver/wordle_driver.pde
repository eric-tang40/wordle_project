Grid g;

int margin, size;
int curRow, curCol;
color green = #11ED19;

void setup() {
  size(600,600);
  size = width/12;
  margin = 10;
  curRow = curCol = 0;
  String[] answer;
  String[] guess;
  
  answer = loadStrings("wordle_answer_words.txt");
  guess = loadStrings("wordle_guess_words.txt");
  //printArray(guess);
  
  g = new Grid(6,5,margin);
}

void draw() {
}

void keyPressed() {
  //if(key == 'd') {
  //  g.boxColorChange(curRow, curCol, color(green));
  //}
  
  if(key >= 'a' && key <= 'z') {
    if(curCol < 5) {
      g.charChange(curRow, curCol, str(key));
      curCol++;
    }
  }
  
  if(key == ENTER  && curCol == 5) {
    String word = "";
    for(int i=4; i>=0; i--) {
      String s = g.getStringOf(curRow, 4-i);
      word += s;
    }
    println(word);
    
    curCol = 0;
    if(curRow < 5) {
      curRow++;
    }
    else {
      println("game has ended");
    }
  }
  
  if(key == BACKSPACE) {
    println("ran");
    if(curCol > 0) {
      curCol--;
    }
    g.charChange(curRow, curCol, "");
  }
}
