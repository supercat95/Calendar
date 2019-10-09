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

void setup() {
 //fullscreen();
 //println("You're going to make a custom calendar!");
 //println("Open the text file called 'Text File' and add a DATE, a TITLE, and a DESCRIPTION, in that order, all on separate lines.");
 //println("Save the file, then Run Processing again.");
 
 calendarText = loadStrings("Text File.txt");

 userDefinedDates = new String[calendarText.length/3];
 userDefinedTitles = new String[calendarText.length/3];
 userDefinedDescriptions = new String[calendarText.length/3];
 
 userDefinedDates[0] = calendarText[0];
 for (int i = 0; i < calendarText.length/3; i ++) {
    userDefinedDates[i] = calendarText[i*3];
    userDefinedTitles[i] = calendarText[i*3+1];
    userDefinedDescriptions[i] = calendarText[i*3+2];   
    println(userDefinedDates[i], userDefinedTitles[i], userDefinedDescriptions[i]); // this works
  }
  
  splitUserInputtedDate();
}

void draw() {
  
}

void splitUserInputtedDate() {
  for (int i = 0; i < calendarText.length/3; i++) {
    dateSplitIntoComponents = splitTokens(userDefinedDates[i], "/-, ");
    println(dateSplitIntoComponents); 
  }
}
