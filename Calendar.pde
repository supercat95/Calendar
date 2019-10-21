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
float xPosOfTiles;
float yPosOfTiles;
float dimensionsOfTiles;

String[] months;
String[] days;
String[] years;
String[] titles;
String[] descriptions;

String[] dateText;
String[] textForFrontOfTile;

void setup() {
  fullScreen(P3D);
  //frameRate(60);
 
  // initializes and organizes variables based on user inputted data
  calendarText = loadStrings("Text File.txt");

  userDefinedDates = new String[calendarText.length/3];
  userDefinedTitles = new String[calendarText.length/3];
  userDefinedDescriptions = new String[calendarText.length/3];
  
  months = new String[calendarText.length/3];
  days = new String[calendarText.length/3];
  years = new String[calendarText.length/3];
  
  dateText = new String[calendarText.length/3];
  textForFrontOfTile = new String[calendarText.length/3];
  
  labelUserInputtedLines();
  splitUserInputtedDate();
  
  createAndDrawTheTiles();
  createTextObjects();
  
}

void draw() {
  drawTheText();
}

// ----------------------------------------------------------------------------
void labelUserInputtedLines() {
  for (int i = 0; i < calendarText.length/3; i ++) {
    userDefinedDates[i] = calendarText[i*3];
    userDefinedTitles[i] = calendarText[i*3+1];
    userDefinedDescriptions[i] = calendarText[i*3+2];   
  }
}

void splitUserInputtedDate() {
  for (int i = 0; i < calendarText.length/3; i++) {
    dateSplitIntoComponents = splitTokens(userDefinedDates[i], "/-, ");
    
    months[i] = dateSplitIntoComponents[0]; 
    days[i] = dateSplitIntoComponents[1];
    years[i] = dateSplitIntoComponents[2];

    dateText[i] = userDefinedTitles[i] + "\n" + months[i] + "\n" + days[i] + "\n" + years[i]; 
  }     
}

// ----------------------------------------------------------------------------
void determinePositionsOfTilesBasedOnNumberOfTiles() {
  switch(tiles.length) {
      case 1:
        tiles[0].xPosOfTile = width/2;
        tiles[0].yPosOfTile = height/2;
        break;
      case 2:
        tiles[0].xPosOfTile = width/4;
        tiles[0].yPosOfTile = height/2;
        tiles[1].xPosOfTile = 3*width/4;
        tiles[1].yPosOfTile = height/2;
        break;
      case 3:
        tiles[0].xPosOfTile = width/6;
        tiles[0].yPosOfTile = height/4;
        tiles[1].xPosOfTile = 5*width/6;
        tiles[1].yPosOfTile = height/4;
        tiles[2].xPosOfTile = width/2;
        tiles[2].yPosOfTile = 3*height/4;
        break;
      case 4:
        tiles[0].xPosOfTile = 3*width/10;
        tiles[0].yPosOfTile = height/4;
        tiles[1].xPosOfTile = 7*width/10;
        tiles[1].yPosOfTile = height/4;
        tiles[2].xPosOfTile = 3*width/10;
        tiles[2].yPosOfTile = 3*height/4;
        tiles[3].xPosOfTile = 7*width/10;
        tiles[3].yPosOfTile = 3*height/4;
        break;
      default: // prints instructions on screen
        textAlign(CENTER);
        textSize(20);
        textLeading(50);
        text(instructions, width/2, 2*height/5);
        break;
    }
}

// ----------------------------------------------------------------------------
void createAndDrawTheTiles() {
  tiles = new Tile[calendarText.length/3];
  for (int i = 0; i < calendarText.length/3; i++) {
    tiles[i] = new Tile(xPosOfTiles, yPosOfTiles);
  }
  determinePositionsOfTilesBasedOnNumberOfTiles();  
  for (int i = 0; i < calendarText.length/3; i++) {
    tiles[i].drawTile();
  }
}

// ----------------------------------------------------------------------------
void createTextObjects() {
  for (int i = 0; i < tiles.length; i ++) {
    tiles[i].createSubclassTextObjects();
  }
}

void drawTheText() {
   fill(125,125,125);
   textAlign(CENTER);
   textLeading(tiles[0].getDimensionsOfTile() / 10.0);
   textSize(tiles[0].getDimensionsOfTile() / 6.0);
   
   for (int i = 0; i < calendarText.length/3; i++) {
     tiles[i].text[i].drawFrontSideText(dateText[i]);
   }
}

// ----------------------------------------------------------------------------
void mouseClicked() {
  for (int i = 0; i < calendarText.length/3; i++) {
    if (mouseX >= tiles[i].xPosOfTile - (tiles[0].dimensionsOfTile / 2.0) && mouseX <= tiles[i].xPosOfTile + (tiles[0].dimensionsOfTile / 2.0)
      && mouseY >= tiles[i].yPosOfTile - (tiles[0].dimensionsOfTile / 2.0) && mouseY <= tiles[i].yPosOfTile + (tiles[0].dimensionsOfTile / 2.0)) {
        tiles[i].tileFlipsWhenClickedOn();
        //tiles[i].text[i].textFlipsWhenClickedOn(userDefinedDescriptions[i]);
        //fill(random(0,255),random(0,255),random(0,255));
        //text("I got clicked on", width/2, height/2);
    }
  }
}
