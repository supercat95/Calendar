class Text extends Tile {
  // inherited from Tile:
  // float dimensionsOfTile;
  
  String eventText;
  
  String[] eventMonths;
  String eventMonth;
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
  
  void drawText(String dateText) {
    //text("This is a test", xPosOfText, yPosOfText);
    eventText = dateText;
    text(eventText, xPosOfText, yPosOfText - (super.dimensionsOfTile/ 4.0));
  }
  
  //--------------------------------------------------
   void textFlipsWhenClickedOn() {
    rotateZ(PI);
    this.drawText(eventMonth);
  }
  
} // end of Text subclass
