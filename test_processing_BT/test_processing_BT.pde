import processing.serial.*;

Serial myPort;  // Create object from Serial class
String val;     // Data received from the serial port

void setup()
{
  // I know that the first port in the serial list on my mac
  // is Serial.list()[0].
  // On Windows machines, this generally opens COM1.
  // Open whatever port is the one you're using.
  printArray(Serial.list());
//  String portName = Serial.list()[1]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, "/dev/tty.HC-05-SPPDev", 38400);
  myPort.bufferUntil('\n');
//  myPort = new Serial(this, portName, 9600);

}

void keyPressed(){
  if (key == '1'){ port.write('1');}
    if (key == '0'){port.write('0');}
    
void serialEvent(Serial myPort){
  string = port.readStringUntil('\n');}

//void draw()
//{
//  if ( myPort.available() > 0) 
//  {  // If data is available,
//  val = myPort.readStringUntil('\n');         // read it and store it in val
//  } 
//  println(val); //print it out in the console
//}
