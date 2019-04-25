/*
    Reading Data Radar File
    CG - last updated 19 March 2019
*/


//String angle = "";
//String distance = "";
int angle;
int distance;
String noObject;
float pixsDistance;
int iAngle, iDistance;
int index1=0;
int index2=0;
PFont orcFont;
//String data = "";
String data = "";
//int[] Data;
int index = 0;
int[] intData;

void setup() {
  
 size (1440, 800); // ***CHANGE THIS TO YOUR SCREEN RESOLUTION***
 //size (1920, 1080);
 smooth();
// myPort = new Serial(this,"/dev/cu.usbmodem14201", 9600); // starts the serial communication
// myPort.bufferUntil('.'); // reads the data from the serial port up to the character '.'. So actually it reads this: angle,distance.
// orcFont = loadFont("OCRAExtended-30.vlw");

  String[] stuff = loadStrings("/Users/cg/Desktop/data-radar.txt");
  println("Stuff: ", stuff[0], "\n");
  
//  println("index: ", index);
//  if (index < stuff.length){
    String[] data = split(stuff[index], ',');  
    println("Data: ", data[0], "\n");
    println("Stuff length: ", stuff.length);
    println("Data length: ", data.length);

    for (int i = 0; i < data.length; i++){
//    for (int i = 0; i < 10; i++){
        intData = int(split(data[i], '.'));
        angle = int(intData[0]);
        distance = int(intData[1]);
        println("i: ", i);
        println("Angle: ", angle);
        println("Distance: ", distance);
        draw();
    }
    
//  }

}
void draw() {
  
  fill(98,245,31);
//  textFont(orcFont);
  // simulating motion blur and slow fade of the moving line
//  noStroke();
//  fill(0,4); 
//  rect(0, 0, width, height-height*0.065); 
  
  fill(98,245,31); // green color
  // calls the functions for drawing the radar
//  drawRadar(); 
//    drawLine();
  drawObject();
  drawText();
}


void drawRadar() {
  pushMatrix();
  translate(width/2,height-height*0.074); // moves the starting coordinats to new location
  noFill();
  strokeWeight(2);
  stroke(98,245,31);
  // draws the arc lines
  arc(0,0,(width-width*0.0625),(width-width*0.0625),PI,TWO_PI);
  arc(0,0,(width-width*0.27),(width-width*0.27),PI,TWO_PI);
  arc(0,0,(width-width*0.479),(width-width*0.479),PI,TWO_PI);
  arc(0,0,(width-width*0.687),(width-width*0.687),PI,TWO_PI);
  // draws the angle lines
  line(-width/2,0,width/2,0);
  line(0,0,(-width/2)*cos(radians(30)),(-width/2)*sin(radians(30)));
  line(0,0,(-width/2)*cos(radians(60)),(-width/2)*sin(radians(60)));
  line(0,0,(-width/2)*cos(radians(90)),(-width/2)*sin(radians(90)));
  line(0,0,(-width/2)*cos(radians(120)),(-width/2)*sin(radians(120)));
  line(0,0,(-width/2)*cos(radians(150)),(-width/2)*sin(radians(150)));
  line((-width/2)*cos(radians(30)),0,width/2,0);
  popMatrix();
}

void drawObject() {
  pushMatrix();
  translate(width/2,height-height*0.074); // moves the starting coordinats to new location
  strokeWeight(5);
  stroke(255,10,10); // red color
  pixsDistance = distance*((height-height*0.1666)*0.025); // covers the distance from the sensor from cm to pixels
  // limiting the range to 50 cms
  if(distance < 50){
    // draws the object according to the angle and the distance
//  line(pixsDistance*cos(radians(angle)),-pixsDistance*sin(radians(angle)),(width-width*0.505)*cos(radians(angle)),-(width-width*0.505)*sin(radians(angle)));
  point(pixsDistance*cos(radians(angle)),-pixsDistance*sin(radians(angle)));
//  point((width-width*0.505)*cos(radians(angle)),-(width-width*0.505)*sin(radians(angle)));

}
  popMatrix();
}

void drawLine() {
  pushMatrix();
  strokeWeight(9);
  stroke(30,250,60);
  translate(width/2,height-height*0.074); // moves the starting coordinats to new location
  line(0,0,(height-height*0.12)*cos(radians(angle)),-(height-height*0.12)*sin(radians(angle))); // draws the line according to the angle
  popMatrix();
}

void drawText() { // draws the texts on the screen
  
  pushMatrix();
  if(distance>50) {
  noObject = "Out of Range";
  }
  else {
  noObject = "In Range";
  }
  fill(0,0,0);
  noStroke();
  rect(0, height-height*0.0648, width, height);
  fill(98,245,31);
  textSize(25);
  
  text("10cm",width-width*0.3854,height-height*0.0833);
  text("20cm",width-width*0.281,height-height*0.0833);
  text("30cm",width-width*0.177,height-height*0.0833);
  text("40cm",width-width*0.0729,height-height*0.0833);
  textSize(40);
  text("Object: " + noObject, width-width*0.875, height-height*0.0277);
  text("Angle: " + angle +" °", width-width*0.48, height-height*0.0277);
  text("Distance: ", width-width*0.26, height-height*0.0277);
  if(distance<50) {
  text("        " + distance +" cm", width-width*0.225, height-height*0.0277);
  }
  textSize(25);
  fill(98,245,60);
  translate((width-width*0.4994)+width/2*cos(radians(30)),(height-height*0.0907)-width/2*sin(radians(30)));
  rotate(-radians(-60));
  text("30°",0,0);
  resetMatrix();
  translate((width-width*0.503)+width/2*cos(radians(60)),(height-height*0.0888)-width/2*sin(radians(60)));
  rotate(-radians(-30));
  text("60°",0,0);
  resetMatrix();
  translate((width-width*0.507)+width/2*cos(radians(90)),(height-height*0.0833)-width/2*sin(radians(90)));
  rotate(radians(0));
  text("90°",0,0);
  resetMatrix();
  translate(width-width*0.513+width/2*cos(radians(120)),(height-height*0.07129)-width/2*sin(radians(120)));
  rotate(radians(-30));
  text("120°",0,0);
  resetMatrix();
  translate((width-width*0.5104)+width/2*cos(radians(150)),(height-height*0.0574)-width/2*sin(radians(150)));
  rotate(radians(-60));
  text("150°",0,0);
  popMatrix(); 
}
