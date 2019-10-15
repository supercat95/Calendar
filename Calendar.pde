/*
    Joy Bates
    Project 3
    Calendar
*/

String instructions = "You're going to make a custom calendar!\nOpen the text file called 'Text File'\nAdd a DATE (written in any standard US format), a TITLE for the event, and a DESCRIPTION, in that order, all on separate lines.\nYou can do this up to 4 times. Do not leave blank lines.\nSave the file, then Run Processing again.\n";
String[] calendarText;
String[] userDefinedDates;
String[] userDefinedTitles;
String[] userDefinedDescriptions;

String[] dateSplitIntoComponents;

Tile[] tiles;

void setup() {
  fullScreen();
 
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
  }
  determine_xPositionsOfTilesBasedOnNumberOfTile();  
  for (int i = 0; i < calendarText.length/3; i++) {
    tiles[i].drawTile();
  }
       
}

void draw() {
  fill(0,0,0);
  rect(0,0,50,50);
  textSize(10);
  fill(255,255,255);
  text(pmouseX,10,10);
  text(pmouseY,10,30);
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

// ----------------------------------------------------------------------------
void determine_xPositionsOfTilesBasedOnNumberOfTile() {
  switch(tiles.length) {
      case 1:
        tiles[0].xPosOfTile = width/2;
        break;
      case 2:
        tiles[0].xPosOfTile = width/3;
        tiles[1].xPosOfTile = 3*width/4;
        break;
      case 3:
        tiles[0].xPosOfTile = width/6;
        tiles[1].xPosOfTile = 5*width/6;
        tiles[2].xPosOfTile = width/2;
        break;
      case 4:
        tiles[0].xPosOfTile = 17*width/5;
        tiles[1].xPosOfTile = 7*width/5;
        tiles[2].xPosOfTile = 17*width/5;
        tiles[3].xPosOfTile = 7*width/5;
        break;
      default: // prints instructions on screen
        textAlign(CENTER);
        textSize(20);
        textLeading(50);
        text(instructions, width/2, 2*height/5);
        break;
    }
}
