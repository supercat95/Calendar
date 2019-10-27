int rotation = 0;
void setup() {
  size(300,300,P3D);
  frameRate(5);
  background(0,0,0);
}

void draw() {
  background(0,0,0);
  pushMatrix();
  translate(width/2,height/2);
  rotateY(rotation);
  rect(0,0,50,50);
  popMatrix();
  rotation++;
}
