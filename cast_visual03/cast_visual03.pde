import java.text.SimpleDateFormat;
import java.util.*;

LineSystem LINE_SYSTEM = new LineSystem();
color baseColor = color(242, 242, 242);

// color[] colorList = {
//   #8db6ff, #f9ff7d, #f91c71, #7cf2b1
// };

void setup() {
  size(1080, 1080);
  background(baseColor);
  smooth();
}

void update() {
  LINE_SYSTEM.update();
  // if (frameCount % 10 != 0) return;

  Line l = new Line();
  float offset = 200;
  l.position(new PVector(
    random(width / 2 - offset, width / 2 + offset),
    random(height / 2 - offset, height / 2 + offset)
  ));
  float speed = 1;
  l.velocity(new PVector(random(-speed, speed), random(-speed, speed)));
  l.angle(random(TWO_PI));
  l.length(random(200, 300));

  l.vertexColor(color(random(255), random(255), random(255)));
  // l.vertexColor(colorList[int(random(colorList.length))]);
  // p.life(1000);
  LINE_SYSTEM.addLine(l);
}

void draw() {
  update();
  loadPixels();
  for (int i = 0; i < width * height; i++) {
    color c = pixels[i];
    float coef = 0.001;
    pixels[i] = color(
      ceil(lerp(red(c), red(baseColor), coef)),
      ceil(lerp(green(c), green(baseColor), coef)),
      ceil(lerp(blue(c), blue(baseColor), coef))
    );
  }
  updatePixels();
	noFill();
	strokeWeight(0.1);
  stroke(0);
  strokeCap(SQUARE);

  LINE_SYSTEM.draw();
  // saveFrame("frames/######.tif");
}

void keyPressed() {
  if (key == 's') {
    Date date = new Date();
    String dateString = new SimpleDateFormat("yyyyMMdd_hhmmss").format(date);
    save(dateString + ".png");
  }
}
