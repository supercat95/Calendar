class Text extends Tile {
  // inherited from Tile:
  // float dimensionsOfTile;

  String[] eventMonths;
  String[] eventDays;
  String[] eventYears;
  String[] eventTitles;
  String[] eventDescriptions;
  
  String eventText;
  String descriptionText;
  
  float xPosOfText;
  float yPosOfText;
  
  //================================================== 
  Text(float xPos, float yPos) {
    super(xPos,yPos);
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
  
  void drawFrontSideText(String dateText) {
    eventText = dateText;
    text(eventText, 0, 0  - (tiles[0].dimensionsOfTile/ 3.25), 1);
  }
  
  void drawBackSideText(String eventDescription) {
    descriptionText = eventDescription;
    rotateY(PI);
    text(descriptionText, 0, 0, 1);
  }
  
} // end of Text subclass
