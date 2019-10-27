void setup(){
  size(600,600,P3D);
}

void draw() {
  background(0,0,0);
  fill(255,255,255);
  text("Scale = 0", width/2, height/4,0);
  
  translate(width/2, 3*height/4);
  rotateY(PI);
  text("Scale = -1", 0,0);
}
