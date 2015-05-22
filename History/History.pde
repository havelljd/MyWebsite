void setup() {
  size(900, 400);
  background(100);
  frameRate(25);
}

void draw() {
  background(100);
  textSize(10);
  strokeWeight(3);
  line(100, 225, 800, 225);
  eventHist("The Analytical Engine - 1833", "Created by Charles Babbage for navigational purposes.", 80, 170, true);
  eventHist("ENIAC - 1946", "The first programmable computer in the U.S.", 150, 280, false);
  eventHist("Z2 - 1939", "First electromechanical relay system.", 250, 170, true);
  eventHist("Colossus - 1943", "Built for cracking German code in World War II.", 318, 280, false);
  eventHist("Baby - 1948","World's first stored program computer.", 400, 170, true);
  eventHist("EDSAC - 1949", "Its design was used for creating the first commecially available computer.", 480, 280, false);
  eventHist("IBM 305 RAMAC - 1956", "First computer that used a disk drive for storage.", 580, 170, true);
  eventHist("Intel 4004 - 1971", "First computer to utilize a microprocessor.", 670, 280, false); {
  fill(255);
  textSize(50);
  text("The History of Computing", 125, 50);
  textSize(15);
  text("J.H.", 860, 380); }
}

void eventHist(String eName, String details, int xpos, int ypos, boolean top) {
  if (top) {
  textSize(10);
  fill(255);
  line(xpos+25, ypos+10, xpos+50, ypos+50);
  text(eName, xpos, ypos);
 
  
  if (mouseX > xpos-50 && mouseX < xpos+100 &&
    mouseY > ypos-20 && mouseY < ypos+10) {
      fill(200, 200, 44);
      text(details, xpos+50, ypos-20);
    }
} else {//if (!top) {
  line(xpos-5, ypos-15, xpos+50, ypos-50);
  textSize(10);
  fill(255);
  text(eName, xpos-50, ypos);
  
  if (mouseX > xpos-50 && mouseX < xpos+100 &&
    mouseY > ypos-20 && mouseY < ypos+10) {
      textSize(10);
      fill(200, 200, 44);
      text(details, xpos-37, ypos+20); }
}
}


