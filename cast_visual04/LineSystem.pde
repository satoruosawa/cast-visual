class LineSystem {
  private ArrayList<Line> lines = new ArrayList<Line>();

  public void update() {
    for (Line l : lines) {
      l.resetForce();
    }

    Iterator<Line> lineIterator = lines.iterator();
    while (lineIterator.hasNext()) {
      Line l = lineIterator.next();
      l.update();
      if (l.isDead()) lineIterator.remove();
    }
  }

  public void draw() {
    for (Line l : lines) {
      l.draw();
    }
  }

  public void addLine(Line l) { lines.add(l); }
  public Line getLine(int index) { return lines.get(index); }
}
