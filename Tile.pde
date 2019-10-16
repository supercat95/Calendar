class Tile {
  float dimensionsOfTile;
  float xPosOfTile;
  float yPosOfTile;
  
  //==================================================
  Tile() { // unused default constructor with meaningless variables
    this.dimensionsOfTile = 0;
    this.xPosOfTile = 0;
    this.yPosOfTile = 0;
  }
  
  Tile(float xPos, float yPos) {
    this.setDimensionsOfTile();
    this.xPosOfTile = xPos;  
    this.yPosOfTile = yPos;
  }
 
  //==================================================
  void setDimensionsOfTile() {
    dimensionsOfTile = width/3;
    if (tiles.length >= 3) {
      dimensionsOfTile = width/4;
    }
  }
  
  float getDimensionsOfTile() {
    return dimensionsOfTile;
  }
  
  //--------------------------------------------------
  void drawTile() {
    fill(255,255,255);
    stroke(0,0,0);
    strokeWeight(4);
    rectMode(CENTER);
    rect(xPosOfTile, yPosOfTile, getDimensionsOfTile(), getDimensionsOfTile());
  }
  
  void tileFlipsWhenClickedOn() {
    rotateZ(PI);
  }
  
  
} // end of Tile class
