PImage tmp;
PImage[] img = new PImage[3];
int x, y, w, h, r = 100, r2 = 100;
int num = int( map(r2, 10, 20, 100, 200) );

void setup() {
  img[0] = loadImage("bleghX.jpg");
  img[1] = loadImage("oy.jpg");
  img[2] = loadImage("vey.jpg");
  size(900, 600);
  inside_doThis();
  frameRate(2);
}

void draw() {}

void doThis(int v, float v1, float v2) {
  w = (int) random(r2, 3 * r2);
  h = (int) random(r2, 3 * r2);
  x = (int) random(v1, v2 - w);
  y = (int) random(height - h);
  tmp = createImage(w, h, RGB);
  tmp.loadPixels();
  int c = 0;
  for (int j = 0; j < h; j++) {
    for (int i = 0; i < w; i++) {
      tmp.pixels[c] = img[v].get(x + i, y + j);
      c++;
    }
  }
  tint(255, 100);
  image(tmp, x + random(-r, r), y + random(-r, r));
}

void inside_doThis() {
  for (int i = 0; i < num; i++) {
    doThis(0, 0, width);
    doThis(1, width, width);
  }
}

void mousePressed() {
  background(img[0]);
  inside_doThis();
  saveFrame();
}