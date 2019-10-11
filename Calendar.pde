/*
    Joy Bates
    Project 3
    Calendar
*/

String[] calendarText;
String[] userDefinedDates;
String[] userDefinedTitles;
String[] userDefinedDescriptions;

String[] dateSplitIntoComponents;

Tile[] tiles;

void setup() {
  //fullscreen();
  println("You're going to make a custom calendar!\nOpen the text file called 'Text File'\nAdd a DATE (written in any standard US format), a TITLE for the event, and a DESCRIPTION, in that order, all on separate lines.\nYou can do this up to 4 times. Do not leave blank lines.\nSave the file, then Run Processing again.\n" );
 
  // initializes and organizes variables based on user inputted data
  calendarText = loadStrings("Text File.txt");

  userDefinedDates = new String[calendarText.length/3];
  userDefinedTitles = new String[calendarText.length/3];
  userDefinedDescriptions = new String[calendarText.length/3];
  
  labelUserInputtedLines();
  splitUserInputtedDate();
  
  // creates the tiles
  tiles = new Tile[calendarText.length/3];
  for (int i = 0; i < calendarText.length/3; i++) {
    tiles[i] = new Tile();
    tiles[i].drawTheTile();
  }
  
  
  // OOP-ify the following once working
   switch(tiles.length) {
      case 0:
        println("Please follow the directions to create a calendar!");
        break;
      case 1:
   }
        
}

void draw() {
  
}

// ----------------------------------------------------------------------------
void labelUserInputtedLines() {
  for (int i = 0; i < calendarText.length/3; i ++) {
    userDefinedDates[i] = calendarText[i*3];
    userDefinedTitles[i] = calendarText[i*3+1];
    userDefinedDescriptions[i] = calendarText[i*3+2];   
    println(userDefinedDates[i], userDefinedTitles[i], userDefinedDescriptions[i]); // this works
  }
  println("\n");
}

void splitUserInputtedDate() {
  for (int i = 0; i < calendarText.length/3; i++) {
    dateSplitIntoComponents = splitTokens(userDefinedDates[i], "/-, ");
    println(dateSplitIntoComponents); 
  }
}
