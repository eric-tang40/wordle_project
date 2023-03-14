class Grid { 
  
  Box[][] g;
  int numRows, numCols;
  int margin_x, margin_y;
  
  Grid(int rows, int columns, int space) {
    this.numRows = rows ;
    this.numCols = columns;
    g = new Box[numRows][numCols];
    margin = space;
    setupArena();  
  }
  
  void setupArena() {
    for(int i=0; i < numRows; i++) {
      margin_y += 10;
      for(int r=0; r < numCols; r++) {
        margin_x += 10;
        g[i][r] = new Box(width/4 + r * size + margin_x, i * size + margin_y, ""); 
        g[i][r].setup();
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
