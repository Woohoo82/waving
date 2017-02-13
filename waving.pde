float angleZ = 0;
float angleX = PI/3;
float angleW = 0;

public class Point {
     public float x;
     public float y;
     public float z;
     public color c; 
}

void setup(){
  size(800, 600, P3D);
  noFill();
}

Point getPoint(float x, float y, float s){
  Point p = new Point();
  p.x = x*s;
  p.y = y*s;
  float l = sqrt(x*x+y*y);
  p.z = sin(l+angleW); //sqrt(l);
  p.c = color(255*(p.z), 255*(p.z), 255*(1.0-p.z));
  p.z *= s;
  return p;
}

void net(int nx, int ny, int s){
  stroke(255);
  for(int x=-nx/2; x<nx/2; x++){
    for(int y=-ny/2; y<ny/2; y++){
      Point A = getPoint(x,   y  , s);
      Point B = getPoint(x+1, y  , s);
      Point C = getPoint(x  , y+1, s);
      beginShape();
        stroke(A.c); vertex(A.x, A.y, A.z);
        stroke(B.c); vertex(B.x, B.y, B.z);
        stroke(C.c); vertex(C.x, C.y, C.z);
        stroke(A.c); vertex(A.x, A.y, A.z);
      endShape();
    }
  }
}

void draw(){
  background(0);
  
  translate(width/2, height/2, 0);
  rotateX(angleX);
  rotateZ(angleZ);
  
  pushMatrix();
  net(100, 100, 10);
  popMatrix();
  
  angleX = PI*((float)mouseY/(float)height/2);
  angleZ += PI/600;
  angleW -= PI/80;
}