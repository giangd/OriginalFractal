<<<<<<< HEAD
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
=======
Colors c;

public void setup() {
	size(500, 500);
  c = new Colors(true);
	// myFractal(width/2,height/2,500);
  frameRate(20);
	
}  

public void draw() {
  c.run();
  fill(c.getColor());
  stroke(c.getDifferentColor());
  myFractal(width/2,height/2,500);
}

public void myFractal(float x, float y, float size)  {
	if (size < 5) {
    ellipse(x,y,size,size);
  } else {
    ellipse(x-size/2, y, size/2, size/2);
    ellipse(x+size/2, y, size/2, size/2);
    ellipse(x, y-size/2, size/2, size/2);
    ellipse(x, y+size/2, size/2, size/2);

    ellipse(x-size/2, y-size/2, size/2, size/2);
    ellipse(x+size/2, y+size/2, size/2, size/2);
    ellipse(x-size/2, y+size/2, size/2, size/2);
    ellipse(x+size/2, y-size/2, size/2, size/2);
    myFractal(x,y,size/1.5);
  }
}

class NiceColor {
  float x, y, w, val, rate;
  int max = 255;
  float minimum = .75;
  float maximum = 1.5;
  boolean r; //short for random
  
  boolean goBack = false;

  NiceColor(float x, float y, float w, float val, float rate) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.val= val;
    this.rate = rate;
  }

  NiceColor(float val, float rate, boolean r) {
    this.val = val;
    this.rate = rate;
    this.r = r;
  }

  void changeVal() {
    if (goBack) {
      val -= rate;
    } else {
      val += rate;
    }
  }

  float getVal() {
    return val;
  }

  void maxVal() {
    if (val >= max) {
      goBack = true;
      if (r)
        rate = random(minimum, maximum);
    } else if (val <= 0) {
      goBack = false;
      if (r)
        rate = random(minimum, maximum);
    }
  }

  void display() {
    rect(x, y, w, -val);
  }

  void run() { //changes color doesnt display graph
    changeVal();
    maxVal();
  }
}

class Colors {
  NiceColor[] rgb = new NiceColor[3];

  Colors(int startingVal, int startingRate, boolean r) {
    // rgb = {new NiceColor(startingVal, startingRate, random), new NiceColor(startingVal, startingRate, random), new NiceColor(startingVal, startingRate, random)}; //doesnt work?

    for (int i = 0; i < 3; i++) {
      rgb[i] = new NiceColor(startingVal, startingRate, r);
    }
  }

  Colors(boolean r) {
    for (int i = 0; i < 3; i++) {
      rgb[i] = new NiceColor((float)(Math.random()*256), 1.5, r);
    }
  }

  void run() {
    for (NiceColor c : rgb) {
      c.run();
    }
  }

  color getColor() {
    return color(rgb[0].getVal(), rgb[1].getVal(), rgb[2].getVal());
  }

  color getDifferentColor() {
    return color(rgb[1].getVal(), rgb[2].getVal(), rgb[0].getVal());
  }
>>>>>>> 3108a3a191a4d955f81378eec9e600d17ccacd9f
}