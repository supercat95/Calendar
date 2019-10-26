class Tile {
  float dimensionsOfTile;
  float xPosOfTile;
  float yPosOfTile;
  
  boolean tileShouldRotate;
  float rotationIncrement;
  float rotate;
  
  Text[] text = new Text[calendarText.length/3];
  
  //==================================================
  Tile(float xPos, float yPos) {
    setDimensionsOfTile();
    this.xPosOfTile = xPos;  
    this.yPosOfTile = yPos;
    tileShouldRotate = false;
    rotationIncrement = 0.0;
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
    rect(0, 0, getDimensionsOfTile(), getDimensionsOfTile());
}
  
  void tileIsClickedOn() {
    this.tileShouldRotate = !tileShouldRotate;
    this.rotationIncrement = 0.1;
  }
  
  void tileFlipsWhenClickedOn() {
    pushMatrix();
      translate(this.get_xPosOfTile(), this.get_yPosOfTile(), 0);
      rotateY(rotate);
        this.drawTile();   
    popMatrix();
    rotate -= rotationIncrement;
    println(this.rotate);
  }
  
  //--------------------------------------------------
  void createSubclassTextObjects() {
    for (int i = 0; i < calendarText.length/3; i++) {
      text[i] = new Text(get_xPosOfTile(), get_yPosOfTile());
    }
  }
  
} // end of Tile class
