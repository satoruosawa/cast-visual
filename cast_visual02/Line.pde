class Line {
  private PVector position = new PVector(0, 0);
  private PVector velocity = new PVector(0, 0);
  private float angle = 0;
  private PVector force = new PVector(0, 0);
  private float life = 100;
  private float length = 1;

  public void update() {
    updatePosition();
    life -= 1;
  }

  protected void updatePosition() {
    velocity.add(force);
    position.add(velocity);
  }

  public void draw() {
    PVector shift = new PVector(cos(angle), sin(angle)).mult(length);
    PVector edge1 = PVector.sub(position, shift);
    PVector edge2 = PVector.add(position, shift);
    line(edge1.x, edge1.y, edge2.x, edge2.y);
  }

  public void resetForce() { force.set(0, 0); }
  public void addForce(PVector f) { force.add(f); }

  public boolean isDead() {
    if (life < 0) {
      return true;
    }
    return false;
  }

  public void position(PVector p) { position = p; }
  public void velocity(PVector v) { velocity = v; }
  public void angle(float a) { angle = a; }
  public void life(float l) { life = l; }
  public void length(float s) { length = s; }

  public PVector position() { return position; }
  public PVector velocity() { return velocity; }
  public float life() { return life; }
  public float length() { return length; }
}
