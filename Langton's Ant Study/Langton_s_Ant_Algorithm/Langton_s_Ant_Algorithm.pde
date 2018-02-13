color black = color(0);
color red = color(176,100,78);
color white = color(255,255,255);
boolean[][] grid;
int aX,aY,dir,GS;

void setup(){
  GS = 10;
  size(1000,1000);
  grid = new boolean[width/GS][height/GS];
  aX = width/2/GS;
  aY = height/2/GS;
  dir = (int)Math.random()*3;
  frameRate(60);
}

void draw(){
 // for(int x = 0; x <10; x++){ 
    for(int i = 0; i < width/GS; i++){
      for (int j = 0; j < height/GS; j++){
        if (grid[i][j] == true){
          fill(black);
          rect(i*GS,j*GS,GS,GS);
        }else{
          fill(white);
          rect(i*GS,j*GS,GS,GS);
        }
      }
    }
    fill(red);
    step();
    print(" " + aX+","+aY + " ");
  //}
}

void step(){
  if (grid[aX][aY] == false){
    dir = dir+1;
    if(dir > 3){
      dir = 0;
    }
    grid[aX][aY] = true;
  }else if (grid[aX][aY] == true){
    dir = dir-1;
    if(dir < 0){
      dir = 3;
    }
    grid[aX][aY] = false;
  }
  if(dir == 0){
      aY++;
      if(aY > height/GS - 1){
        aY = 0;
      }
    }else if (dir == 1){
      aX++;
      if(aX > width/GS -1){
        aX = 0;
      }
    }else if(dir == 2){
      aY--;
      if(aY < 0){
        aY = height/GS - 1;
      }
    }else if(dir == 3){
      aX--;
      if(aX < 0){
        aX = width/GS -1;
      }
    }
}