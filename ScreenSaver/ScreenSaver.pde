Lines[] myLines = new Lines [5];

void setup() {
  frameRate(120);
  background(50);
  size(1000, 450);
  for (int i=0; i<myLines.length; i++) {
    myLines[i] = new Lines(random(width), random(height), random(1, 5), random(1, 20));
  }
}

void draw() {
  for (int i=0; i<myLines.length; i++) {
    Lines iLines = myLines[i];
    iLines.display();
  }
}

void keyPressed() {
  for (int i=0; i<myLines.length; i++) {
    myLines[i] = new Lines(random(width), random(height), random(1, 5), random(1, 20));
  }   
  for (int i=0; i<myLines.length; i++) {
    Lines iLines = myLines[i];
    iLines.display();
  } 
 background(50);
}


class Lines {
  float xpos;
  float ypos;
  float strokeW;
  float pointCount;


  Lines(float tempX, float tempY, float tempStroke, float tempLength) {
    xpos = tempX;
    ypos = tempY;
    strokeW = tempStroke;
    pointCount = tempLength;
  }

  void display() {
    pointCount = random(5);
    stroke(random(100), random(200), random(180));
    if (xpos > width || xpos < 0 || ypos > height || ypos < 0) {
      xpos = random(width);
      ypos = random(height);
    } else {
      if (random(100)>85) {
        strokeWeight(strokeW);
        moveRight(xpos, ypos, pointCount);
      } else if (random(120)>95) {
        strokeWeight(strokeW);
        moveUp(xpos, ypos, pointCount);
      } else if (random(110)>90) {
        strokeWeight(strokeW);
        moveDown(xpos, ypos, pointCount);
      } else if (random(115)>75) {
        strokeWeight(strokeW);
        moveLeft(xpos, ypos, pointCount);
      } else if (random(115)>80) {
        strokeWeight(strokeW);
        moveDownRight(xpos, ypos, pointCount);
      } else if (random(110)>95) {
        strokeWeight(strokeW);
        moveDownLeft(xpos, ypos, pointCount);
      } else if (random(110)>85) {
        strokeWeight(strokeW);
        moveUpRight(xpos, ypos, pointCount);
      } else if (random(110)>80) {
        strokeWeight(strokeW);
        moveUpLeft(xpos, ypos, pointCount);
      }
    }
  }

  void moveRight(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX+i, startY);
      xpos = startX + i;
      ypos = startY;
    }
  }

  void moveLeft(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX-i, startY);
      xpos = startX - i;
      ypos = startY;
    }
  }

  void moveUp(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX, startY-i);
      xpos = startX;
      ypos = startY - i;
    }
  }

  void moveDown(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX, startY+i);
      xpos = startX;
      ypos = startY + i;
    }
  }

  void moveDownRight(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX+i, startY+i);
      xpos = startX+i;
      ypos = startY + i;
    }
  }

  void moveUpRight(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX+i, startY-i);
      xpos = startX+i;
      ypos = startY - i;
    }
  }

  void moveDownLeft(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX-i, startY+i);
      xpos = startX-i;
      ypos = startY + i;
    }
  }

  void moveUpLeft(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX-i, startY-i);
      xpos = startX-i;
      ypos = startY - i;
    }
  }
}



