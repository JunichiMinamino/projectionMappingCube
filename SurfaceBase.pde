
class SurfaceBase 
{
  int _iClassIndex = 0;
  CornerPinSurface surface;
  PGraphics offscreen;
  
  int _iKeyParam = 0;
  
  int iBgRGB[];
  int iCubeRGB[][];
  
  SurfaceBase() {
    
    surface = ks.createCornerPinSurface(600, 600, 60);
    offscreen = createGraphics(600, 600, P3D);
    
    iBgRGB = new int[3];
    iCubeRGB = new int[9][3];
    
    // init
    setBgRGB(0);
    setCubeRGB(0);
  }
  
  void setClassIndex(int iClassIndex) {
    _iClassIndex = iClassIndex;
  }
  
  void draw() {
    
    offscreen.beginDraw();
    offscreen.background(0, 0, 0);
    offscreen.noStroke();
    
    if (_iKeyParam == 0) {
      offscreen.colorMode(RGB, 256);
      
    } else if (_iKeyParam == 1) {
      offscreen.colorMode(RGB, 256);
      createBgOneColor(0);
      
    } else if (_iKeyParam == 2) {
      offscreen.colorMode(RGB, 256);
      createCubeRect();
    }
    
    offscreen.endDraw();
  }
  
  void render(){
    surface.render(offscreen);
  }
  
  void setKeyParam(int iKeyParam) {
    _iKeyParam = iKeyParam;
  }
  
  
  void setBgRGB(int iIndex) {
    if (iIndex == 0) {
      for (int i = 0; i < 3; i++) {
        iBgRGB[i] = 0;
      }
    } else {
      for (int i = 0; i < 3; i++) {
        iBgRGB[i] = (int)random(256);
      }
    }
  }
  
  void setCubeRGB(int iIndex) {
    if (iIndex == 0) {
      for (int i = 0; i < 9; i++) {
        for (int j = 0; j < 3; j++) {
          iCubeRGB[i][j] = 0;
        }
      }
    } else if (iIndex == 1) {
      // same color
      int iCubeRGBtmp[] = {0, 0, 0};
      for (int j = 0; j < 3; j++) {
        iCubeRGBtmp[j] = (int)random(256);
      }
      for (int i = 0; i < 9; i++) {
        for (int j = 0; j < 3; j++) {
          iCubeRGB[i][j] = iCubeRGBtmp[j];
        }
      }
    } else {
      // random all
      for (int i = 0; i < 9; i++) {
        for (int j = 0; j < 3; j++) {
          iCubeRGB[i][j] = (int)random(256);
        }
      }
    }
  }
  
  // 1 rect
  void createBgOneColor(int type) {
    float diameter = 600;
    if (type > 0) {
      diameter = sin(frameCount / 10.0) * 300 + 300;
    }
    offscreen.fill(iBgRGB[0], iBgRGB[1], iBgRGB[2]);
    offscreen.rectMode(CENTER);
    offscreen.rect(300, 300, diameter, diameter);
  }
  
  // 9 rect
  void createCubeRect() {
    int margin = 10;
    int diameter = 200 - margin * 2;
    
    offscreen.rectMode(CORNER);
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        offscreen.fill(iCubeRGB[i * 3 + j][0], iCubeRGB[i * 3 + j][1], iCubeRGB[i * 3 + j][2]);
        offscreen.rect(200 * i + margin, 200 * j + margin, diameter, diameter);
      }
    }
  }
  
}