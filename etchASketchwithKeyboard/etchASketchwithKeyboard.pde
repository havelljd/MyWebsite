int x, y;

void setup() {
  size(900, 400);
  frameRate(60);
  background(175);
  // Set start coords
  x = width/2;
  y = height/2;
}

void draw() {
  fill(255);
  stroke(random(0, 255), random(0, 255), random(0, 255));
  //drawName();
  //noLoop();
}

 void keyPressed() {
   if (key==CODED) {
       if (keyCode==RIGHT) {
     moveRight(1);
    } else if (keyCode==DOWN) {
      moveDown(1);
    } else if (keyCode==LEFT) {
      moveLeft(1);
    } else if (keyCode==UP) {
      moveUp(1);
    } 
   }
  } 
 
 void mouseClicked() {
  background(175);
 }
 
// Algorithm for your first name
/*void drawName() {
  moveRight(15);
  moveDown(25);
  moveLeft(9);
  moveUp(10);
  moveDown(10);
  moveRight(12);
  moveUp(1);
  moveLeft(1);
  moveDown(1);
  moveRight(3);
  moveUp(25);
  moveDown(12);
  moveRight(15);
  moveUp(13);
  moveDown(26);
  moveRight(3);
  moveUp(1);
  moveLeft(1);
  moveDown(1);
}*/

void moveRight(int rep) {
  for (int i=0; i<rep*10; i++) {
    point(x+i, y);
  }
  x=x+(10*rep);
}

void moveLeft(int rep) {
  for (int i=0; -i<rep*10; i--) {
    point(x+i, y);
  }
  x=x-(10*rep);
}

void moveDown(int rep) {
  for (int i=0; i<rep*10; i++) {
    point(x, y+i);
  }
  y=y+(10*rep);
}

void moveUp(int rep) {
  for (int i=0; -i<rep*10; i--) {
    point(x, y+i);
  }
  y=y-(10*rep);
}

