/*
    Joy Bates
    Project 3
    Calendar
*/

String[] calendarText;
String[] dates;
String[] names;
String[] descriptions;

String[] months;
String[] days;
String[] years;

void setup() {
 //fullscreen();
 //println("You're going to make a custom calendar!");
 //println("Open the text file called 'Text File' and add a DATE, a TITLE, and a DESCRIPTION, in that order, all on separate lines.");
 //println("Save the file, then Run Processing again.");
 
 calendarText = loadStrings("Text File.txt");

 dates = new String[calendarText.length/3];
 names = new String[calendarText.length/3];
 descriptions = new String[calendarText.length/3];
 
 dates[0] = calendarText[0];
 for (int i = 0; i < calendarText.length/3; i ++) {
    dates[i] = calendarText[i*3];
    names[i] = calendarText[i*3+1];
    descriptions[i] = calendarText[i*3+2];   
    println(dates[i], names[i], descriptions[i]); // this works
  }
  
  identifyDifferentMonthFormats();
}

void draw() {
  
}

void identifyDifferentMonthFormats() {
  for (int i = 0; i < calendarText.length/3; i++) {
    months = split(dates[i], "/");
    //months = split(dates[i], " ");
    //months = split(dates[i], "-");
    println(months[0]); // this works
  }
}
