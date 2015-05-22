Button[] numButtons = new Button[10];
Button[] opButtons = new Button[7];
Button[] spButtons = new Button[1];

String displayValue = "0";
String valueToCompute = ""; 
String valueToCompute2 = "";
float valueToComputeI = 0;
float valueToComputeI2 = 0;
float result = 0;
char opValue;
boolean firstNum;


void setup() {
  size(250, 300);
  background(0, 25, 160);
  frameRate(10);
  noFill();
  strokeWeight(3);
  stroke(200);
  rect(10, 10, 230, 35, 7);
  numButtons[0] = new Button(65, 250).asNumber(0, 45, 45);
  numButtons[1] = new Button(10, 195).asNumber(1, 45, 45);
  numButtons[2] = new Button(65, 195).asNumber(2, 45, 45);
  numButtons[3] = new Button(120, 195).asNumber(3, 45, 45);
  numButtons[4] = new Button(10, 140).asNumber(4, 45, 45);
  numButtons[5] = new Button(65, 140).asNumber(5, 45, 45);
  numButtons[6] = new Button(120, 140).asNumber(6, 45, 45);
  numButtons[7] = new Button(10, 85).asNumber(7, 45, 45);
  numButtons[8] = new Button(65, 85).asNumber(8, 45, 45);
  numButtons[9] = new Button(120, 85).asNumber(9, 45, 45);
  opButtons[0] = new Button(205, 85).asOperator("+", 35, 35);
  opButtons[1] = new Button(205, 127).asOperator("-", 35, 35);
  opButtons[4] = new Button(205, 170).asOperator("÷", 35, 35);
  opButtons[2] = new Button(205, 215).asOperator("x", 35, 35);
  opButtons[3] = new Button(205, 260).asOperator("=", 35, 35);
  opButtons[5] = new Button(190, 50).asOperator("C", 50, 30);
  opButtons[6] = new Button(10, 250).asOperator("±", 45, 45);
  spButtons[0] = new Button(120, 250).asSpecial(".", 45, 45);
  //opButtons[7] = new Button(10, 20).asOperator("√", 50, 30);
  firstNum = true;
}


void draw() {

  for (int i=0; i<numButtons.length; i++) {
    Button inumButton = numButtons[i];
    inumButton.display();
  }

  for (int i=0; i<opButtons.length; i++) {
    Button iopButton = opButtons[i];
    iopButton.display();
  }

  for (int i=0; i<spButtons.length; i++) {
    Button ispButton = spButtons[i];
    ispButton.display();
  }

  updateDisplay();
 // println(mouseX, mouseY);
}

void mousePressed() {
  for (int i=0; i<numButtons.length; i++) {
    Button inumButton = numButtons[i];
    inumButton.click();
    if (inumButton.overBox) {
      if (firstNum) {
        println(i + "" + inumButton);
        valueToCompute += int(inumButton.numButtonValue);
        displayValue = valueToCompute;
      } else {
        valueToCompute2 += int(inumButton.numButtonValue);
        displayValue = valueToCompute2;
      }
    }
  }



  for (int i=0; i<opButtons.length; i++) {
    Button iopButton = opButtons[i];
    iopButton.click();
    if (iopButton.overBox) {
      if (iopButton.opButtonValue == "+") {
        if (result !=0) {
          opValue = '+';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "+";
        } else {
          opValue = '+';
          firstNum = false;
          displayValue = "+";
        }
      } else if (iopButton.opButtonValue == "=") {
        firstNum = true;
        performCalculation();
      } else if (iopButton.opButtonValue == "-") {
        if (result !=0) {
          opValue = '-';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "-";
        } else {
          opValue = '-';
          firstNum = false;
          displayValue = "-";
        }
      } else if (iopButton.opButtonValue == "x") {
        if (result !=0) {
          opValue = '*';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "x";
        } else {
          opValue = '*';
          firstNum = false;
          displayValue = "x";
        }
      } else if (iopButton.opButtonValue == "÷") {
        if (result !=0) {
          opValue = '/';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "÷";
        } else {
          opValue = '/';
          firstNum = false;
          displayValue = "÷";
        }
      } else if (iopButton.opButtonValue == "C") {
        displayValue = "0";
        opValue = 'C';
        valueToCompute = "";
        valueToCompute2 = "";
        valueToComputeI = 0;
        valueToComputeI2 = 0;
        result = 0;
        firstNum = true;
      } else if (iopButton.opButtonValue == "±") {
        opValue = 'n';
        performCalculation();
      } else if (iopButton.opButtonValue == "√") {
        if (result !=0) {
          opValue = '√';
          valueToCompute = "";
          firstNum = false;
          displayValue = "√";
        } else {
          opValue = '√';
          firstNum = false;
          displayValue = "√";
        }
      }
    }
  }

  for (int i=0; i<spButtons.length; i++) {
    Button ispButton = spButtons[i];
    ispButton.click();
    if (ispButton.overBox) {
      if (ispButton.spButtonValue == ".") {
        if (ispButton.overBox && firstNum == true) {
          valueToCompute += ispButton.spButtonValue;
          displayValue = valueToCompute;
        } else if (ispButton.overBox && firstNum == false) {
          valueToCompute2 += ispButton.spButtonValue;
          displayValue = valueToCompute2;
        }
      }
    }
  }
}

//√



void performCalculation() {
  valueToComputeI = float(valueToCompute);
  valueToComputeI2 = float(valueToCompute2);

  if (opValue == '+') {
    result = valueToComputeI + valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == '-') {
    result = valueToComputeI - valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == '*') {
    result = valueToComputeI * valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == '/') {
    result = valueToComputeI / valueToComputeI2;
    displayValue = str(result);
  } else if (opValue =='n') {
    if (firstNum) {
      valueToComputeI = valueToComputeI * -1;
      displayValue = str(valueToComputeI);
    } else {
      valueToComputeI2 = valueToComputeI2 * -1;
      displayValue = str(valueToComputeI);
    }
  }



  if (firstNum) {
    valueToCompute = displayValue;
  } else {
    valueToCompute = displayValue;
    valueToCompute2 = "";
  }
}


void updateDisplay() {
  fill(200, 200, 120);
  rect(10, 10, 230, 35, 7);
  fill(0);
  textSize(25);
  text(displayValue, 15, 37);
}

void keyPressed() {
  //  if(key == '=' || keyCode == RETURN || keyCode == ENTER)
  //  handleKeyPressOp("=");
  if (key == '1') {
    handleKeyPressNum("1");
  } else if (key == '2') {
    handleKeyPressNum("2");
  } else if (key == '3') {
    handleKeyPressNum("3");
  } else if (key == '4') {
    handleKeyPressNum("4");
  } else if (key == '5') {
    handleKeyPressNum("5");
  } else if (key == '6') {
    handleKeyPressNum("6");
  } else if (key == '7') {
    handleKeyPressNum("7");
  } else if (key == '8') {
    handleKeyPressNum("8");
  } else if (key == '9') {
    handleKeyPressNum("9");
  } else if (key == '0') {
    handleKeyPressNum("0");
  }
}

void handleKeyPressNum (String keyPress) {
  if (firstNum) {
    valueToCompute += keyPress;
    displayValue = valueToCompute;
  } else {
    valueToCompute2 += keyPress;
    displayValue = valueToCompute2;
  }
}

class Button {
  //class variables
  boolean isNumber;
  boolean isSpecial;
  boolean isOperator;
  float numButtonValue;
  String opButtonValue;
  String spButtonValue;
  float xpos;
  float ypos;
  int buttonW = 30;
  int buttonH = 30;
  boolean overBox = false;

  //Constructor for number buttons
  Button asNumber(float tempNumButtonValue, int tempW, int tempH) {
    isNumber = true;
    numButtonValue = tempNumButtonValue;
    buttonW = tempW;
    buttonH = tempH;
    return this;
  }

  //Constructor for just buttons
  Button(float tempXpos, float tempYpos) {
    xpos = tempXpos;
    ypos = tempYpos;
    println(numButtonValue);
  }
  //Constructor for operator buttons
  Button asOperator(String tempOpButtonValue, int tempW, int tempH) {
    opButtonValue = tempOpButtonValue;
    isOperator = true;
    buttonW = tempW;
    buttonH = tempH;
    return this;
  }

  //Constructor for special buttons
  Button asSpecial(String tempSpButtonValue, int tempW, int tempH) {
    spButtonValue = tempSpButtonValue;
    isSpecial = true;
    buttonW = tempW;
    buttonH = tempH;
    return this;
  }

  void clickButton() {
  }

  //Drawing the button
  void display() {
    if (isNumber) {
      fill(255);
      stroke(0);
      strokeWeight(2);
      rect(xpos, ypos, buttonW, buttonH, 6);
      fill(150, 200, 40);
      textSize(24);
      text(int(numButtonValue), xpos + 15, ypos + 30);
    } else if (isSpecial) {
      fill(255);
      stroke(0);
      strokeWeight(2);
      rect(xpos, ypos, buttonW, buttonH, 6);
      fill(0);
      textSize(24);
      text(spButtonValue, xpos+20, ypos+30);
    } else if (isOperator) {
      fill(150, 180, 175);
      stroke(0);
      strokeWeight(2);
      rect(xpos, ypos, buttonW, buttonH, 6);
      fill(0);
      textSize(24);
      text(opButtonValue, xpos+11, ypos + 25);
  }
}
  //Handle mouse actions
  void click() {
    overBox = mouseX > xpos && mouseX < xpos+buttonW &&  mouseY > ypos && mouseY < ypos+buttonH;
  }
}

