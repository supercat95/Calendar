class Text extends Tile {
  // inherited from Tile:
  // float dimensionsOfTile;
  
  String[] eventMonths;
  String[] eventDays;
  String[] eventYears;
  String[] eventTitles;
  String[] eventDescriptions;
  
  float xPosOfText;
  float yPosOfText;
  
  //==================================================
  Text(float xPos, float yPos) {
    super(xPos, yPos);
    this.xPosOfText = super.xPosOfTile;
    this.yPosOfText = super.yPosOfTile;
  }
  
  Text(float xPos, float yPos, String[] months, String[] days, String[] years, String[] titles, String[] descriptions) {
    super(xPosOfTiles, yPosOfTiles);
    this.xPosOfText = super.xPosOfTile;
    this.yPosOfText = super.yPosOfTile;
    
    this.eventMonths = months;
    this.eventDays = days;
    this.eventYears = years;
    this.eventTitles = titles;
    this.eventDescriptions = descriptions;
  }
  
  //==================================================
  void passInVariablesNeededForText(String[] months, String[] days, String[] years, String[] titles, String[] descriptions) {
    this.eventMonths = months;
    this.eventDays = days;
    this.eventYears = years;
    this.eventTitles = titles;
    this.eventDescriptions = descriptions;
  }
  
  void drawMonth(String[] months) {
    //text("This is a test", xPosOfText, yPosOfText);
    eventMonths = months;
    for (int i = 0; i < calendarText.length/3; i++ ) {
      text(eventMonths[i], xPosOfText, yPosOfText - (1/4 * super.dimensionsOfTile));
    }
  }
  
  //--------------------------------------------------
   void textFlipsWhenClickedOn() {
    rotateZ(PI);
    this.drawMonth(months);
  }
  
} // end of Text subclass
