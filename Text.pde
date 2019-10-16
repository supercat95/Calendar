class Text extends Tile {
  String[] eventMonths;
  String[] eventDays;
  String[] eventYears;
  String[] eventTitles;
  String[] eventDescriptions;
  
  float xPosOfText;
  float yPosOfText;
  
  //==================================================
  Text() {
    this.xPosOfText = super.xPosOfTile;
    this.yPosOfText = super.yPosOfTile;
  }
  
  Text(String[] months, String[] days, String[] years, String[] titles, String[] descriptions) {
    super(xPosOfTiles, yPosOfTiles); // not sure if this is needed
    this.eventMonths = months;
    this.eventDays = days;
    this.eventYears = years;
    this.eventTitles = titles;
    this.eventDescriptions = descriptions;
  }
  
  //==================================================
  void drawText() {
    fill(125,125,125);
    text("This is a test", xPosOfText, yPosOfText);
  }
  
} // end of Text subclass
