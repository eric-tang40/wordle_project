Grid g;

int margin, size;
int curRow, curCol;
color green = #11ED19;
color gray = #A2A2A2;
color yellow = #D6CB54;
String answer;
String[] answer_list;
String[] guess;

void setup() {
  size(600,600);
  size = width/12;
  margin = 10;
  curRow = curCol = 0;
  
  answer_list = loadStrings("wordle_answer_words.txt");
  guess = loadStrings("wordle_guess_words.txt");
  //printArray(guess);
  
  g = new Grid(6,5,margin);
  answer = generateRandomAnswer(answer_list); 
  //for the future, we can code answer into keyPressed after we create a 
  //start or a home screen.
  println(answer);
}

void draw() {
}

String generateRandomAnswer(String a[]) {
  String answer = "";
  int randomIndex = int(random(0, a.length));
  answer = a[randomIndex];
  answer = answer.toUpperCase();
  return answer;
}

boolean equalsAnswer(String answer, String attempt) {
  if(answer.equals(attempt)) {
    return true;
  }
  return false;
}

boolean checkinList(String a[], String attempt) {
  for(int i=0; i<a.length; i++) {
    attempt = attempt.toLowerCase();
    if(attempt.equals(a[i])) {
      return true;
    }
  }
  return false;
}

String evaluateAttempt(String a[], String answer, String attempt) {
  if(checkinList(a, attempt)) {
    if(equalsAnswer(answer, attempt)) {
      return "that's correct";
    }
    else {
      return "incorrect";
    }
  }
  else {
    return "that's not a word";
  }
}

void checkBoxes(String answer, String attempt) {
  String[] a;
  String[] b;
  a = new String[5];
  b = new String[5];
  for(int i=0; i<answer.length(); i++) {
    a[i] = str(answer.charAt(i));
    b[i] = str(attempt.charAt(i));
  }
  for(int i=0; i<b.length; i++) {
    String c = b[i];
    int num_falses = 0;
    for(int r=0; r<a.length; r++) {
      if(c.equals(a[r]) == false) {
        num_falses++;
      }
      if(c.equals(a[i])) {
        g.boxColorChange(curRow, i, color(green));
        num_falses = 100;
      }
    }
    if(num_falses == 5) {
      g.boxColorChange(curRow, i, color(gray));
    }
    else if (num_falses < 5) {
      g.boxColorChange(curRow, i, color(yellow));
    }
  }
}

void keyPressed() {
  //if(key == 'd') {
  //  g.boxColorChange(curRow, curCol, color(green));
  //}
  
  if(key >= 'a' && key <= 'z') {
    if(curCol < 5) {
      String user_input = str(key);
      user_input = user_input.toUpperCase();
      g.charChange(curRow, curCol, user_input);
      curCol++;
    }
  }
  
  if(key == ENTER  && curCol == 5) {
    String word = "";
    for(int i=4; i>=0; i--) {
      String s = g.getStringOf(curRow, 4-i);
      word += s;
    }
    println(evaluateAttempt(guess, answer, word));
    //if(checkinList(guess, word)) {
      checkBoxes(answer, word);
    //}
    //maybe put checkBoxes inside of evaluate Attempt and only call evaluateAttmept
    
    curCol = 0;
    if(curRow < 5) {
      curRow++;
    }
    else {
      println("game has ended");
    }
  }
  
  if(key == BACKSPACE) {
    if(curCol > 0) {
      curCol--;
    }
    g.charChange(curRow, curCol, "");
  }
}
