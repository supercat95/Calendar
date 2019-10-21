class Text extends Tile {
  // inherited from Tile:
  // float dimensionsOfTile;
  
  String eventText;
  String descriptionText;
  
  String[] eventMonths;
  String eventDate;
  String[] eventDays;
  String[] eventYears;
  String[] eventTitles;
  String[] eventDescriptions;
  String eventDescription;
  
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
  
  void drawFrontSideText(String dateText) {
    eventText = dateText;
    text(eventText, xPosOfText, yPosOfText - (super.dimensionsOfTile/ 3.25));
  }
  
  void drawBackSideText(String eventDescription) {
    descriptionText = eventDescription;
    text(descriptionText, xPosOfText, yPosOfText);
  }
  
  //--------------------------------------------------
   void textFlipsWhenClickedOn(String eventDescription) {
    this.drawBackSideText(eventDescription);
  }
  
} // end of Text subclass
