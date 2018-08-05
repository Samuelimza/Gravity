class Mass{
  PVector pos;
  PVector vel;
  PVector acc;
  boolean fixed;
  float m = 10;
  
  Mass(int x, int y, boolean fixed){
    this.fixed = fixed;
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }
  
  void update(){
    if(!fixed){
      vel.add(acc);
      pos.add(vel);
      acc.mult(0);
    }
  }
  
  void feelGravitationalForce(Mass m){
    PVector diffVec = m.pos.copy().sub(this.pos.copy());
    float dist2 = diffVec.magSq();
    dist2 = constrain(dist2, 25.0, 625.0);
    float upper = Q * m.m;
    diffVec.normalize();
    acc.add(diffVec.mult(upper / (dist2)));
    //this.applyForce(diffVec.setMag(1.0).mult((Q * this.m * m.m)/ (500 + dist * dist)));
  }
  
  void applyForce(PVector force){
    acc.add(force.mult(1.0 / m));
  }
  
  void show(){
    fill(255);
    ellipse(pos.x, pos.y, 10, 10);
  }
}
