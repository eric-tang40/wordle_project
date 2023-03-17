class Box {
  
  int bx, by;
  color c;
  String ch;
  int bw, bh;
  
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
  
   Box(int x, int y, String character, int w, int h) {
    bx = x;
    by = y;
    c = color(0);
    ch = character;
    bw = w;
    bh = h;
  }
  
  void setup() {
    square(bx, by, size);
    fill(c);
    textSize(25);
    text(ch, bx + width/35, by + width/17);
    fill(255);
  }
  
  void setupKey(int w, int h) {
    rect(bx, by, w, h);
    fill(c);
    textSize(25);
    text(ch, bx + width/47, by + width/15);
    fill(255);
  }
  
}
