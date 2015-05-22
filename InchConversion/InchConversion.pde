void setup() {
  size(1100, 400);
}

void draw() {
  background(255);
  textSize(30);
  text("Inch Conversion", 450, 50);
  textSize(15);
  text("Created by Jeff Havell", 480, 75);
  float size = inchTocm(mouseX);
  float feet = inchTofoot(mouseX);
  rect(0, 325, mouseX, 25);
  drawReference(150, 300);
  fill(0);
  text(size, 175, 150);
  println(mouseX); 
  text(mouseX, 181, 200);
  text("Inches = ", 110, 200);
  text("Centimeters = ", 70, 150);
  text("Feet = ", 113, 100);
  text(feet, 176, 100);
}

float inchTocm(float inch) {
  float cm = (inch/0.39370);
  return cm;
}

float inchTofoot(float inch) {
  float foot = (inch/12);
  return foot;
}

void drawReference(int xpos, int ypos) {
  stroke(100);
  line(xpos-150, ypos, 1100, ypos);
  for(int i = 0; i<1100; i=i+50) {
    text( i, xpos=i-8, ypos);
    line(xpos+57, ypos, xpos+57, ypos+8);
    //line(xpos+i, ypos, xpos+i-5, ypos+8);
  }
}


