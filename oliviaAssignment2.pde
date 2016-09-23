int shape = 0;
int squareSides = 50; //length of sides for the four corner squares

float x = 50;
float y = 50;

float squareSpeed = 0;
float gravity = 0.1;


//main setup for window
void setup() {
  size(600, 600);
  background(200, 127, 12);
  frameRate(5);               //slows down frames so that the changing colors of the circle are visible
}

//for shape creation
void draw() {

  //circle
  if (shape == 1) {                             //if the mouse has been clicked, create a circle with arbitrary colors
    for (int d = width; d>0; d -=20) {          //loop creates a series of circles
      stroke(0);
      fill(random(80), random(80), random(80)); //color of each circle changes randomly
      ellipseMode(CENTER);
      ellipse(300, 300, d, d);
    }
  }

  //big triangle
  fill(#1607F7);
  triangle(150, 400, 300, 150, 450, 400);

  //quadrilaterals surrounding big triangle
  stroke(0);
  fill(#12B3C6);
  quad(200, 315, 140, 230, 200, 120, 265, 210);

  quad(400, 315, 500, 325, 435, 220, 335, 210);

  quad(190, 490, 230, 400, 360, 400, 320, 485);

  //small triangle
  pushMatrix();                      //within matrix, translates grid in order to achieve rotating effect
  translate(width/2, height/2);
  rotate(frameCount*radians(90)/10); // adds motion to rotation
  translate(0, 0);                   //rotation around origin
  fill(#050505);
  triangle(-50, 50, 0, -50, 50, 50); //rotating triangle
  popMatrix();

  //rectangles
  fill(#DEED3C);

  //upper rectangle
  rectMode(CENTER);
  rect(300, 75, 100, 80);

  //left side rectangle
  pushMatrix();
  translate(45, 375);   //translates the coordinate system's origin
  rotate(radians(345)); //rotates the grid
  rectMode(CORNERS);
  rect (0, 0, 80, 100); //draws the rotated rectangle
  popMatrix();

  //right side rectangle
  pushMatrix();
  translate(485, 365);
  rotate(radians(25));
  rectMode(CORNERS);
  rect (0, 0, 80, 100);
  popMatrix();

  //corner squares
  fill(#ED773C);
  rectMode(CENTER);

  rect(x + 500, y + 500, squareSides, squareSides);
  rect(x, y + 500, squareSides, squareSides);
  rect(x, y, squareSides, squareSides);
  rect(x + 500, y, squareSides, squareSides);

  //make squares "fall", mimicking gravity
  y = y + squareSpeed;
  squareSpeed = squareSpeed + gravity;

  //when squares reach the bottom, they'll go back up and the speed will be decresead every time
  if (y > height) {
    squareSpeed = squareSpeed * -0.95;
    y = height;
  }
}

void mousePressed() { //on mouse click, the block of code inside the if statement is executed.
  shape++;            //on second click, it stops executing
}