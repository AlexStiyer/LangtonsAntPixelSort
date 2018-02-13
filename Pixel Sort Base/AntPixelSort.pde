color lastc,currentc;
PImage current, last, img;
int GS,dir,aX,aY;
boolean marked[][];
int Lcoord[] = new int[2];
int Ccoord[] = new int[2];

void setup(){
 size(300,300);
 GS = 3;
 selectInput("Select a file to process:", "fileSelected");
 while(img==null){
   print("waiting");
 }
 surface.setResizable(true);
 //img = loadImage("original.jpg");
 img.resize(img.width-img.width%GS,img.height-img.height%GS);
 surface.setResizable(false);
 print(img.width);
 print(img.height);
 surface.setSize(img.width,img.height);
 marked = new boolean[width/GS][height/GS];
 dir = (int)Math.random()*3;
 aX=width/2;
 aY=height/2;
}

void draw(){
  //for(int i = 0; i<1; i++){
   image(img,0,0);
   img.loadPixels();
   step();
   img.set(Lcoord[0],Lcoord[1],current);
   img.set(Ccoord[0],Ccoord[1],last);
   img.updatePixels();
  //}
}

void step(){
  last = img.get(aX,aY,GS,GS);
  Lcoord[0]=aX;
  Lcoord[1]=aY;
  if (marked[aX/GS][aY/GS] == false){
    dir = dir+1;
    if(dir > 3){
      dir = 0;
    }
    marked[aX/GS][aY/GS] = true;
  }else if (marked[aX/GS][aY/GS] == true){
    dir = dir-1;
    if(dir < 0){
      dir = 3;
    }
    marked[aX/GS][aY/GS] = false;
  }
  if(dir == 0){
      aY=aY+GS;
      if(aY > height - GS){
        aY = 0;
      }
    }else if (dir == 1){
      aX=aX+GS;
      if(aX > width - GS){
        aX = 0;
      }
    }else if(dir == 2){
      aY=aY-GS;
      if(aY < 0){
        aY = height - GS;
      }
    }else if(dir == 3){
      aX=aX-GS;
      if(aX < 0){
        aX = width - GS;
      }
    }
    current = img.get(aX,aY,GS,GS);
    Ccoord[0]=aX;
    Ccoord[1]=aY;
}

void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
    img = loadImage("original.jpg");
    
  } else {
    img = loadImage(selection.getAbsolutePath());
  }
}