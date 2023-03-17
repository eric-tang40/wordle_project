class Grid { 
  
  Box[][] g;
  int numRows, numCols;
  int margin_x, margin_y;
  int top_margin;
  
  Grid(int rows, int columns, int space) {
    this.numRows = rows ;
    this.numCols = columns;
    g = new Box[numRows][numCols];
    margin = space;
    top_margin = 50;
    setupArena();  
  }
  
  Grid(int rows, int columns, int space, int start_x, int start_y, String[] a) {
    this.numRows = rows ;
    this.numCols = columns;
    g = new Box[numRows][numCols];
    margin = space;
    top_margin = 50;
    setupKeyboard(start_x, start_y, a); 
  }
  
  void setupArena() {
    for(int i=0; i < numRows; i++) {
      margin_y += 10;
      for(int r=0; r < numCols; r++) {
        margin_x += 10;
        g[i][r] = new Box(width/4 + r * size + margin_x, i * size + margin_y + top_margin, ""); 
        g[i][r].setup();
      }
      margin_x = 0;
    }
  }
  
  void setupKeyboard(int x, int y, String[] a) {
    for(int i=0; i < numRows; i++) {
      margin_y += 10;
      for(int r=0; r < numCols; r++) {
        margin_x += 10;
        g[i][r] = new Box(x + int(r*.75*size) + margin_x - 40,y, a[r]); 
        g[i][r].setupKey(width/15, width/10);
      }
      margin_x = 0;
    }
  }
  
  String getStringOf(int row, int column) {
    return g[row][column].ch;
  }
  
  void boxColorChange(int row, int column, color c) {
    fill(c);
    g[row][column].setup();
  }

  void charChange(int row, int column, String newStr) {
    g[row][column].ch = newStr;
    g[row][column].setup();
  }

}
