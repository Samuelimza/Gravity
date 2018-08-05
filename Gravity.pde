float Q = 10;
Mass[] movables;
float k = 5;

void setup(){
  size(600, 600);
  movables = new Mass[10];
  for(int i = 0; i < movables.length; i++){
    movables[i] = new Mass(int(random(width)), int(random(height)), false);
  }
  m1 = new Mass(100, 100, false);
  m2 = new Mass(300, 300, false);
  m1.vel.x = k;
  m2.vel.x = -k;
}

void draw(){
  background(51);
  m1.feelGravitationalForce(m2);
  m2.feelGravitationalForce(m1);
  m1.update();
  m2.update();
  m1.show();
  m2.show();
}
