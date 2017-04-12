import processing.serial.*;

Serial myPort;
int xPos = 1 ;
float oldSensor = 0;


void setup (){
size(600, 400);
frameRate(30);
println(Serial.list());
myPort = new Serial(this, Serial.list()[0],9600);
myPort.bufferUntil('\n');
background(0);
}

void serialEvent(Serial myPort){
String inString = myPort.readStringUntil('\n');
if (inString != null){
inString = trim(inString);
println(inString);
int sensorValue = int(inString);

float sensor = map (sensorValue, 0, 1023, 0,height);
stroke(0,255,0);
line(xPos- 1, height - oldSensor, xPos, height - sensor);
oldSensor = sensor;

if (xPos >= width){
xPos = 0;
background(0);
}else{
  
xPos++;
}
}
}