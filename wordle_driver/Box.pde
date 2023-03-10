class Box {
  
  int bx, by;
  color c;
  String ch;
  
  Box() {
    bx = size * 2;
    by = size;
    c = color(0);
    ch = "";
  }
  
  Box(int x, int y, String character) {
    bx = x;
    by = y;
    c = color(0);
    ch = character;
  }
  
  void setup() {
    square(bx, by, size);
    fill(c);
    textSize(25);
    text(ch, bx + width/35, by + width/17);
    fill(255);
  }
  
  void charChange(String newStr) {
    ch = newStr;
  }
}
