/*
    Joy Bates
    Project 3
    Calendar
*/

String instructions = "You're going to make a custom calendar!\nOpen the text file called 'Text File' and add:\na DATE (written in any US format),\na TITLE for the event,\nand a DESCRIPTION,\nin that order, all on separate lines.\nYou can do this up to 4 times.\nDo not leave blank lines.\nSave the file, then Run Processing again. :)\n";

String[] calendarText;
int numberOfEntries;
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

int rotation = 0;

color[] backgroundColor;
color[][]corkboard;
int widthOfCorkboard;
int heightOfCorkboard;
int sizeOfPixel = 5;

PFont handwriting;

void setup() {
  fullScreen(P3D);
  frameRate(30);
 
  // initializes and organizes variables based on user inputted data
  calendarText = loadStrings("Text File.txt");
  numberOfEntries = calendarText.length/3;
  setupAllStringArrays();
  
  labelUserInputtedLines();
  splitUserInputtedDate();
  
  createTileObjects();
  determinePositionsOfTilesBasedOnNumberOfTiles(); 
  
  setupBackground();
  
  if (tiles.length != 0) {
    handwriting = createFont("BrownBagLunch.ttf", tiles[0].getDimensionsOfTile() / 4.5);
  } else {
    handwriting = createFont("BrownBagLunch.ttf", width/20);
  }
  
  createTextObjects();  
}

void draw() {
  drawBackground();
  
  drawTheTiles();
  
  if (tiles.length != 0) {
    drawTheText();
  }
}  

// ----------------------------------------------------------------------------
void setupAllStringArrays() {
  userDefinedDates = new String[numberOfEntries];
  userDefinedTitles = new String[numberOfEntries];
  userDefinedDescriptions = new String[numberOfEntries];
  
  months = new String[numberOfEntries];
  days = new String[numberOfEntries];
  years = new String[numberOfEntries];
  
  dateText = new String[numberOfEntries];
  textForFrontOfTile = new String[numberOfEntries];
}

void labelUserInputtedLines() {
  for (int i = 0; i < numberOfEntries; i ++) {
    userDefinedDates[i] = calendarText[i*3];
    userDefinedTitles[i] = calendarText[i*3+1];
    userDefinedDescriptions[i] = calendarText[i*3+2];   
  }
}

void splitUserInputtedDate() {
  for (int i = 0; i < numberOfEntries; i++) {
    dateSplitIntoComponents = splitTokens(userDefinedDates[i], "/-, ");
    
    months[i] = dateSplitIntoComponents[0]; 
    days[i] = dateSplitIntoComponents[1];
    years[i] = dateSplitIntoComponents[2];

    dateText[i] = userDefinedTitles[i] + "\n" + months[i] + "\n" + days[i] + "\n" + years[i]; 
  }     
}

// ----------------------------------------------------------------------------
// I wish I was good enough at math to make an equation or algorithm of sorts for this....
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
        tiles[0].xPosOfTile = width/5;
        tiles[0].yPosOfTile = height/3;
        tiles[1].xPosOfTile = 4*width/5;
        tiles[1].yPosOfTile = height/3;
        tiles[2].xPosOfTile = width/2;
        tiles[2].yPosOfTile = 2*height/3;
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
      default:      
        break;
    }
}

// ----------------------------------------------------------------------------
void instructions() {
  fill(#D6C527);
  rectMode(CENTER);
  rect(width/2, height/2, 3*width/4, 3*height/4, 20);
  fill(255,255,255);
  textFont(handwriting);
  textLeading(height/13);
  text(instructions, 11*width/20, height/2, 3*width/4, 3*height/4);
}

// ----------------------------------------------------------------------------
void createTileObjects() {
  tiles = new Tile[numberOfEntries];
  for (int i = 0; i < numberOfEntries; i++) {
    tiles[i] = new Tile(xPosOfTiles, yPosOfTiles);
  }
}

void drawTheTiles() { 
  for (int i = 0; i < numberOfEntries; i++) {
        if (tiles[i].tileShouldRotate) { 
          tiles[i].tileFlipsWhenClickedOn();
          if (tiles[i].rotate % -3.199999 == 0) { // stops the rotation animation
            tiles[i].tileIsClickedOn(); // sets to false
          }
        } else {
        pushMatrix();
          translate(tiles[i].get_xPosOfTile(), tiles[i].get_yPosOfTile(), 0);
            tiles[i].drawTile();
        popMatrix();
        }
  }
}

// ----------------------------------------------------------------------------
void createTextObjects() {
  for (int i = 0; i < tiles.length; i ++) {
    tiles[i].createSubclassTextObjects();
  }
}

void drawTheText() {
   fill(0,0,0);
   textAlign(CENTER);
   textFont(handwriting);
   
   for (int i = 0; i < numberOfEntries; i++) {
     pushMatrix();
     translate(tiles[i].get_xPosOfTile(), tiles[i].get_yPosOfTile());
     if (tiles[i].tileShouldRotate == false) {
        if (tiles[i].text[i].textFlipped == false) {
           tiles[i].text[i].drawFrontSideText(dateText[i]);
        } else {
          tiles[i].text[i].drawBackSideText(userDefinedDescriptions[i], 0.0);
        }
     } else {
       rotateY(tiles[i].rotate + .1);
         tiles[i].text[i].drawFrontSideText(dateText[i]); // rotates away
         tiles[i].text[i].drawBackSideText(userDefinedDescriptions[i], PI);      
       tiles[i].text[i].textFlipped = true;
     } 
    popMatrix();
   }
}

// ----------------------------------------------------------------------------
void setupBackground() {
  if (tiles.length != 0) {
    widthOfCorkboard = width + sizeOfPixel + int(tiles[0].getDimensionsOfTile());
    heightOfCorkboard = height + sizeOfPixel + int(tiles[0].getDimensionsOfTile());
  } else {
    widthOfCorkboard = width + sizeOfPixel;
    heightOfCorkboard = height + sizeOfPixel;
  }
  
  // colors from https://colorideas.net/pickled-bean-dark-gray-smoked-muddy-waters-d8c0a2-color-palette/
  color[] backgroundColor  = {#6f402a, #94633b, #b89261, #0a0707, #47291d, #9c7255, #b89671};
  corkboard = new color[widthOfCorkboard][heightOfCorkboard];
  
  for (int i = 0; i < widthOfCorkboard; i += sizeOfPixel) {
    for (int j = 0; j < heightOfCorkboard; j += sizeOfPixel) {
        corkboard[i][j] = backgroundColor[int(random(backgroundColor.length))];
    }
  }
}

void drawBackground() {
  pushMatrix();
  if (tiles.length != 0) {
    translate(0 - tiles[0].getDimensionsOfTile(), 0 - tiles[0].getDimensionsOfTile(), 0 - tiles[0].getDimensionsOfTile());
  }
    scale(1.25,1.25,0);
      for (int i = 0; i < widthOfCorkboard; i += sizeOfPixel) {
        for (int j = 0; j < heightOfCorkboard; j += sizeOfPixel) {
          noStroke();
          fill(corkboard[i][j]);
          rect(i,j,sizeOfPixel,sizeOfPixel);
        }
      }
  popMatrix();
}

// ----------------------------------------------------------------------------
void mousePressed() {
 for (int i = 0; i < numberOfEntries; i++) {
    if (mouseX >= tiles[i].xPosOfTile - (tiles[0].dimensionsOfTile / 2.0) && mouseX <= tiles[i].xPosOfTile + (tiles[0].dimensionsOfTile / 2.0)
      && mouseY >= tiles[i].yPosOfTile - (tiles[0].dimensionsOfTile / 2.0) && mouseY <= tiles[i].yPosOfTile + (tiles[0].dimensionsOfTile / 2.0)) {
        tiles[i].tileIsClickedOn();
    }
  }
}
