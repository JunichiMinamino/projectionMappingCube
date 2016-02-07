import deadpixel.keystone.*;

Keystone ks;

SurfaceBase surface[] = new SurfaceBase[3];

void setup() {
  
  size(displayWidth, displayHeight, P3D);
  frameRate(60);
  
  ks = new Keystone(this);
  
  for (int i = 0; i < 3; i++) {
    surface[i] = new SurfaceBase();
    surface[i].setClassIndex(i);
  }
}

void draw() {
  
  for (int i = 0; i < 3; i++) {
    surface[i].draw();
  }
  
  background(0);
  
  for (int i = 0; i < 3; i++) {
    surface[i].render();
  }
}

void keyPressed() {
  
  switch(key) {
  case '0':
  case '1':
  case '2':
    int iKey = Character.getNumericValue(key);
    for (int i = 0; i < 3; i++) {
      surface[i].setKeyParam(iKey);
    }
    
    if (iKey == 1) {
      for (int i = 0; i < 3; i++) {
        surface[i].setBgRGB(1);
      }
    }
    
    if (iKey == 2) {
      for (int i = 0; i < 3; i++) {
        surface[i].setCubeRGB(1);
      }
    }
    break;
    
  case 'c':
    ks.toggleCalibration();
    break;
  case 'l':
    ks.load();
    break;
  case 's':
    ks.save();
    break;
  }
}