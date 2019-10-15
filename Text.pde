class Text extends Tile {
  String[] eventMonths;
  String[] eventDays;
  String[] eventYears;
  String[] eventTitles;
  String[] eventDescriptions;
  
  // front side
  float xPosOfTitleText;
  float yPosOfTitleText;
  float xPosOfDateText;
  float yPosOfDateText;
  
  // back side
  float xPosOfDescriptionText;
  float yPosOfDescriptionText;
  
  //--------------------------------------------------
  Text(String[] months, String[] days, String[] years, String[] titles, String[] descriptions) {
    super(xPos, yPos);
    set_eventMonth();
    set_eventDay();
    set_eventYear();
    set_eventTitle();
    set_eventDescription();
  }
  
  //--------------------------------------------------
  void set_eventMonth() {
    eventMonths = months;
  }
  
  //--------------------------------------------------
  void set_eventDay() {
    eventDays = days;
  }
  
  //--------------------------------------------------
  void set_eventYear() {
    eventYears = years;
  }
  
  //--------------------------------------------------
  void set_eventTitle() {
    eventTitles = titles;
  }
  
  //--------------------------------------------------
  void set_eventDescription() {
    eventDescriptions = descriptions;
  }
  
  
} // end of Text subclass
