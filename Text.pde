class Text extends Tile {
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
  
  void drawMonth() {
    //text("This is a test", xPosOfText, yPosOfText);
    for (int i = 0; i < calendarText.length/3; i++ ) {
      //text(
    }
  }
  
  //--------------------------------------------------
   void textFlipsWhenClickedOn() {
    rotateZ(PI);
    this.drawText();
  }
  
} // end of Text subclass
