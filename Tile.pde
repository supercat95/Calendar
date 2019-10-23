class Tile {
  float dimensionsOfTile;
  float xPosOfTile;
  float yPosOfTile;
  
  float rotate;
  float yPos;
  
  Text[] text = new Text[calendarText.length/3];
  
  //==================================================
  Tile(float xPos, float yPos) {
    setDimensionsOfTile();
    this.xPosOfTile = xPos;  
    this.yPosOfTile = yPos;
    rotate = 0.0;
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
    rect(this.get_xPosOfTile(), this.get_yPosOfTile(), getDimensionsOfTile(), getDimensionsOfTile());
  }
  
  void tileFlipsWhenClickedOn(float rotation) {
    rotate = rotation;    
    pushMatrix();
      translate(this.get_xPosOfTile(), this.get_yPosOfTile() - (getDimensionsOfTile() / 1.25), 0 - getDimensionsOfTile() - sin(rotate) * 270);
      rotateY(rotate *= -1);
          this.drawTile();   
        //this.text[].drawBackSideText(get_xPosOfTile(), get_yPosOfTile());
    popMatrix();
  }
  
  //--------------------------------------------------
  void createSubclassTextObjects() {
    for (int i = 0; i < calendarText.length/3; i++) {
      text[i] = new Text(get_xPosOfTile(), get_yPosOfTile());
    }
  }
  
} // end of Tile class
