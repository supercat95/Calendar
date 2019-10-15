class Tile {
  float dimensionsOfTile;
  float xPosOfTile;
  float yPosOfTile;
  
  //--------------------------------------------------
  Tile(float xPos) {
    setDimensionsOfTile();
    //xPosOfTile = width/2;
    yPosOfTile = height/2;
   
  }
 
  //--------------------------------------------------
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
  void set_xPositioningOfTile() {
    
  }
  
  float get_xPositioningOfTile() {
    return xPosOfTile;
  }
  
  //--------------------------------------------------
  
  void set_yPositioningOfTile() {
    
  }
  
  float get_yPositioningOfTile() {
    return yPosOfTile;
  }
  
  //--------------------------------------------------
  void drawTile() {
    fill(255,255,255);
    stroke(0,0,0);
    strokeWeight(4);
    rectMode(CENTER);
    rect(get_xPositioningOfTile(), get_yPositioningOfTile(), getDimensionsOfTile(), getDimensionsOfTile());
  }
  
  void tileFlipsWhenClickedOn() {}
  
  
} // end of Tile class
