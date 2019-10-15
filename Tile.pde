class Tile {
  float dimensionsOfTile;
  float xPosOfTile;
  float yPosOfTile;
  
  //--------------------------------------------------
  Tile() {
    dimensionsOfTile = width/3;
    //xPosOfTile = width/2;
    yPosOfTile = height/2;
   
  }
 
  //--------------------------------------------------
  void setDimensionsOfTile() {
    if (tiles.length >= 3) {
      dimensionsOfTile *= 0.75;
    }
  }
  
  float getDimensionsOfTile() {
    return dimensionsOfTile;
  }
  //--------------------------------------------------
  void set_xPositioningOfTile() {
    switch(tiles.length) {
      case 0: 
        text("Please follow the directions to create a calendar!",width/2,height/2);
        break;
      case 1:
        tiles[0].xPosOfTile = width/2;
        break;
      case 2:
        tiles[0].xPosOfTile = width/3;
        tiles[1].xPosOfTile = 3*width/4;
        break;
      case 3:
        tiles[0].xPosOfTile = width/6;
        tiles[1].xPosOfTile = 5*width/6;
        tiles[2].xPosOfTile = width/2;
        break;
      case 4:
        tiles[0].xPosOfTile = 17*width/5;
        tiles[1].xPosOfTile = 7*width/5;
        tiles[2].xPosOfTile = 17*width/5;
        tiles[3].xPosOfTile = 7*width/5;
    }
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
  void drawTheTile() {
    pushMatrix();
      fill(255,255,255);
      stroke(0,0,0);
      strokeWeight(4);
      rectMode(CENTER);
      rect(get_xPositioningOfTile(), get_yPositioningOfTile(), getDimensionsOfTile(), getDimensionsOfTile());
    popMatrix(); 
  }
  
  void tileFlipsWhenClickedOn() {}
  
  
} // end of Tile class
