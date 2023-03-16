Grid g;

int margin, size;
int curRow, curCol;
color green = #11ED19;
color gray = #A2A2A2;
color yellow = #D6CB54;
String answer;
String[] answer_list;
String[] guess;
String [] won_messages;
boolean won = false;
boolean is_word = true;

void setup() {
  background(230);
  size(600,700);
  size = width/12;
  margin = 10;
  curRow = curCol = 0;
  answer_list = loadStrings("wordle_answer_words.txt");
  guess = loadStrings("wordle_guess_words.txt");
  won_messages = new String[6];
  setWonMessages(won_messages);
  
  g = new Grid(6,5,margin);
  answer = generateRandomAnswer(answer_list); 
  //for the future, we can code answer into keyPressed after we create a 
  //start or a home screen.
  println(answer);
}

void draw() {
  if(won == false) {
    if(is_word) {
      displayText("WORDLE", width/2 - 25, margin/2 + size/2);
    }
    else {
      displayText("Not in the Word List", width/3 + 25, margin/2 + size/2);
    }
  }
  else {
    int random = int(random(0,6));
    String random_message = won_messages[random];
    displayText(random_message, width/2 - 25, margin/2 + size/2);
    noLoop();
  }
}

void displayText(String text, int x, int y) {
  noStroke();
  fill(230);
  rect(width/4 + margin, margin/2, width/2 - margin, size);
  stroke(0);
  fill(0);
  strokeWeight(4);
  textSize(20);
  text(text, x, y);
  strokeWeight(1);
  stroke(0);
  fill(255);
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
    is_word = false;
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
    
    if(evaluateAttempt(guess, answer, word) == "that's not a word") {
      //error message display
    }
    else {
      if(evaluateAttempt(guess, answer, word) == "that's correct") {
        won = true;
      }
      checkBoxes(answer, word);
      if(evaluateAttempt(guess, answer, word) == "incorrect") {
        curCol = 0;
        if(curRow < 5) {
          curRow++;
        }
      }
    }
  }
  
  if(key == BACKSPACE) {
    if(curCol > 0) {
      curCol--;
    }
    if(won == false) {
      g.charChange(curRow, curCol, "");
    }
    else {
      //restart button appears
      //game summary,etc
    }
    if(is_word == false) {
      is_word = true;
    }
  }
}

void setWonMessages(String[] a) {
  a[0] = "Winner";
  a[1] = "Great";
  a[2] = "You won";
  a[3] = "Nice Job";
  a[4] = "Good"; 
  a[5] = "Lucky";
}
