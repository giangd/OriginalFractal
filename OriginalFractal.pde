void setup() {
	size(500,500);
	fractal(width/2,height/2,300);
}

void draw() {
}

void fractal(int x, int y, float len) {
	if (len <= 20) {
  		ellipse(x,y,len,len);
	} else {
		fractal(x,y,len/1.2);
	}
}