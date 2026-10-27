Particle[] arr = new Particle[370]; 
int particleL = 360; 
double angleD = 1.0/particleL; 
boolean mode = true; 

void setup() { 
  background(255); 
  size(400, 400); 
  noStroke(); 
  for(int i = 0; i < particleL; i++) 
    arr[i] = new Particle((double)i/particleL); 
  for(int i = particleL; i < arr.length; i++) 
    arr[i] = new OddBallParticle(); 
} 

void draw() { 
  if(!mode) 
    background(255); 
  for(int i = 0; i < arr.length; i++) { 
    arr[i].move(); 
    arr[i].show(); 
  }   
} 

void mousePressed() {
  if(mode) 
    mode = false; 
  else 
    mode = true; 
} 

class Particle { 

  double myX, myY, a, og, ogint, s, sp; 
  color c; 
  
  Particle() { 
    myX = myY = a = og = ogint = s = sp = 0; 
    c = color(0); 
  } 

  Particle(double angle) { 
    myX = myY = 200; 
    a = angle*(TWO_PI); 
    og = a; 
    ogint = (int)a; 
    sp = Math.random()*5+1; 
    int offset = (int)(Math.random()*30); 
    c = color(15-offset, 15-offset, 60-offset); 
  } 

  void move() {
    myX += Math.cos(a)*sp; 
    myY += Math.sin(a)*sp; 
    a += angleD*(TWO_PI); 
    if(((int)a - 7) == ogint) 
      a = og; 
    if(myX > 400 || myX < 0 || myY > 400 || myY < 0) {
      myX = 200; 
      myY = 200; 
    } 
  } 

  void show() { 
    fill(c); 
    s = dist(200, 200, (float)myX, (float)myY) * 0.075; 
    ellipse((float)myX, (float)myY, (float)s, (float)s); 
  } 
  
} 

class OddBallParticle extends Particle { 
  
  OddBallParticle() { 
    myX = Math.random()*400; 
    myY = Math.random()*400; 
    a = og = ogint = s = sp = 0; 
    c = color(237, 235, 105); 
  } 
  
  void move() {
    myX = myX + (int)(Math.random()*3)-1; 
    myY = myY + (int)(Math.random()*3)-1; 
  } 
  
  void show() { 
    drawT(myX, myY, 20, 1, 250); 
    drawT(myX, myY, 15, 5, c); 
    drawT(myX, myY, 11, 7, c); 
    drawT(myX, myY, 7, 20, 255); 
  } 
  
  void drawT(double x, double y, int s, int op, int col) { 
    fill(col, op); 
    triangle((float)x-s/2, (float)y, (float)x, (float)y-s, (float)x+s/2, (float)y); 
    triangle((float)x-s/2, (float)y, (float)x, (float)y+s, (float)x+s/2, (float)y); 
  } 
  
} 
