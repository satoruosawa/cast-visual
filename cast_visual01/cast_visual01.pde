import java.text.SimpleDateFormat;
import java.util.*;

ParticleSystem PARTICLE_SYSTEM = new ParticleSystem();
color baseColor = color(242, 242, 242);

void setup() {
  size(1080, 1080);
  background(baseColor);
  smooth();
}

void update() {
  // if (frameCount % 10 != 0) return;
  Particle p = new Particle();
  float offset = 100;
  p.position(new PVector(
    random(0 + offset, width - offset),
    random(0 + offset, height - offset)
  ));
  float speed = 1;
  p.velocity(new PVector(random(-speed, speed), random(-speed, speed)));
  // p.life(1000);
  PARTICLE_SYSTEM.addParticle(p);

  PARTICLE_SYSTEM.update();
}

void draw() {
  update();
  loadPixels();
  for (int i = 0; i < width * height; i++) {
    color c = pixels[i];
    float coef = 0.05;
    pixels[i] = color(
      ceil(lerp(red(c), red(baseColor), coef)),
      ceil(lerp(green(c), green(baseColor), coef)),
      ceil(lerp(blue(c), blue(baseColor), coef))
    );
  }
  updatePixels();
	noFill();
	strokeWeight(0.05);
  stroke(0);

  beginShape();
  PARTICLE_SYSTEM.draw();
  endShape();
  // saveFrame("frames/######.tif");
}

void keyPressed() {
  if (key == 's') {
    Date date = new Date();
    String dateString = new SimpleDateFormat("yyyyMMdd_hhmmss").format(date);
    save(dateString + ".png");
  }
}
