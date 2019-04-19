class Line {
  private PVector position = new PVector(0, 0);
  private PVector velocity = new PVector(0, 0);
  private float angle = 0;
  private float angleVelocity = 0;
  private PVector force = new PVector(0, 0);
  private float life = 100;
  private float length = 1;
  private float width = 1;

  public void update() {
    updatePosition();
    life -= 1;
  }

  protected void updatePosition() {
    velocity.add(force);
    position.add(velocity);
    angle += angleVelocity;
  }

  public void draw() {
    PVector edge1 =
      new PVector(length / 2, width / 2).rotate(angle).add(position);
    PVector edge2 =
      new PVector(length / -2, width / 2).rotate(angle).add(position);
    PVector edge3 =
      new PVector(length / -2, width / -2).rotate(angle).add(position);
    PVector edge4 =
      new PVector(length / 2, width / -2).rotate(angle).add(position);
    quad(
      edge1.x, edge1.y, edge2.x, edge2.y, edge3.x, edge3.y, edge4.x, edge4.y);
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
  public void angleVelocity(float v) { angleVelocity = v; }
  public void life(float l) { life = l; }
  public void length(float s) { length = s; }
  public void width(float w) { width = w; }

  public PVector position() { return position; }
  public PVector velocity() { return velocity; }
  public float life() { return life; }
  public float length() { return length; }
}
