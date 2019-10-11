class Tile {
  float dimensionsOfTile;
  float xPosOfTile;
  float yPosOfTile;
 
  float xOffset;
  float yOffset;
  
  //--------------------------------------------------
  Tile() {
    dimensionsOfTile = width/3;
    xPosOfTile = width/2 - (width/6);
    yPosOfTile = height/3;
   
  }
 
  //--------------------------------------------------
  float determineDimensionsOfTile() {
    if (tiles.length >= 3) {
      dimensionsOfTile *= 0.75;
    }
    return dimensionsOfTile;
  }
  
  float determine_xPositioningOfTile() {
    return xPosOfTile;
  }
  
  float determine_yPositioningOfTile() {
    return yPosOfTile;
  }
  
  //--------------------------------------------------
  void drawTheTile() {
    pushMatrix();
      fill(255,255,255);
      stroke(0,0,0);
      strokeWeight(4);
      
      rect(determine_xPositioningOfTile(), determine_yPositioningOfTile(), determineDimensionsOfTile(), determineDimensionsOfTile());
    popMatrix(); 
  }
  
  void tileFlipsWhenClickedOn() {}
  
  
} // end of Tile class
