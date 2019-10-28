class Text extends Tile {
  // inherited from Tile:
  // float dimensionsOfTile;
  // float rotate

  String[] eventMonths;
  String[] eventDays;
  String[] eventYears;
  String[] eventTitles;
  String[] eventDescriptions;
  
  boolean textFlipped;
  String eventText;
  String descriptionText;
  
  float descriptionWidth;
  int numberOfLinesNeeded;
  int leading;
  
  float xPosOfText;
  float yPosOfText;
  
  //================================================== 
  Text(float xPos, float yPos) {
    super(xPos,yPos);
    this.xPosOfText = super.xPosOfTile;
    this.yPosOfText = super.yPosOfTile;
    textFlipped = false;
    descriptionWidth = 0;
    leading = 0;
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
 
    textFlipped = false;
    descriptionWidth = 0;
    leading = 0;
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
    textLeading(super.getDimensionsOfTile() / 4.0);
    text(eventText, 0, 0  - (tiles[0].dimensionsOfTile/ 3.25), 1);
  }
  
  //--------------------------------------------------
   void setLeadingForBackSideText(String eventDescription) {
    descriptionText = eventDescription; 
    descriptionWidth = textWidth(descriptionText);
    numberOfLinesNeeded = ceil(descriptionWidth / int(super.getDimensionsOfTile()) + 2);
    leading = int(super.getDimensionsOfTile()) / numberOfLinesNeeded;
  }
  
  int getLeading() {
    return leading;
  }
  
  void drawBackSideText(String eventDescription, float rotation) {
    descriptionText = eventDescription;   
    rotateY(rotation); 
    textLeading(this.getLeading());
    translate(0,0,1);
    text(descriptionText, 0, 0, tiles[0].dimensionsOfTile, tiles[0].dimensionsOfTile); 
  }
  
} // end of Text subclass
