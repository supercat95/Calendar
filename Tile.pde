class Tile {
  float dimensionsOfTile;
  float xPosOfTile;
  float yPosOfTile;
  
  Text[] text = new Text[calendarText.length/3];
  
  //==================================================
  Tile(float xPos, float yPos) {;imensionsOfTile();
    this.xPosOfTile = xPos; 
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
  float get_xPosOfTile() {
    return xPosOfTile;
  }
  
  //--------------------------------------------------
  float get_yPosOfTile() {
    return yPosOfTile;
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
    this.drawTile();
    //this.text[].drawText(get_xPosOfTile(), get_yPosOfTile());
  }
  
  //--------------------------------------------------
  void createSubclassTextObjects() {
    for (int i = 0; i < calendarText.length/3; i++) {
      text[i] = new Text(get_xPosOfTile(), get_yPosOfTile());
    }
  }
  
} // end of Tile class
