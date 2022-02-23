float ang,angS,angPl;
PImage agua, sol, lava, arena, tierra, luna, roca, galaxy;
PShape planetaAgua, planetaSol, planetaLuna, planetaLava, planetaArena, planetaTierra, planetaRoca;
int posX,posY,posZ;

void setup(){
  size(900,900,P3D);
  ang=0;
  ang=0;
  angPl=0;
  stroke(0);
  agua=loadImage("/images/agua.jpeg");
  sol=loadImage("/images/sol.jpg");
  lava=loadImage("/images/lava.jpeg");
  arena=loadImage("/images/arena.jpg");
  tierra=loadImage("/images/tierra.jpg");
  luna=loadImage("/images/luna.jpg");
  roca=loadImage("/images/roca.jpg");
  galaxy=loadImage("/images/galaxy.jpg");
  
  planetaAgua= setShapeObj(planetaAgua, agua, 20);
  planetaLuna= setShapeObj(planetaLuna, luna, 50);
  planetaTierra= setShapeObj(planetaTierra, tierra, 60);
  planetaSol= setShapeObj(planetaSol, sol, 10);
  planetaLava= setShapeObj(planetaLava, lava, 35);
  planetaArena= setShapeObj(planetaArena, arena, 30);
  planetaRoca= setShapeObj(planetaRoca, roca, 46);
}

PShape setShapeObj(PShape pl, PImage img, int size){
  beginShape();
  pl = createShape(SPHERE, size);
  pl.setStroke(255); 
  pl.setTexture(img);
  endShape(CLOSE);
  return pl;
}


void draw(){
  background(galaxy);
  rotateX(radians(-40));
  translate(width/2,height/2,0);
  pushMatrix();
  rotateY(radians(ang));
  shape(planetaLuna);
  rotateX(radians(ang*(-2)));
  textSize(30);
  text("Luna", -15, -60);
  translate(-width*0.1,0,0);
  shape(planetaAgua);
  rotateZ(radians(ang*(-1)));
  textSize(20);
  text("Agua", -15, -20);
  popMatrix();
  ang+=0.4;
  if(ang==360)ang=0;
  
  pushMatrix();
  rotateZ(radians(angS));
  translate(-width*0.1,0,0);
  shape(planetaSol);
  rotateZ(radians(angPl*(-2)));
  textSize(30);
  text("Sol", -15, -20);
  popMatrix();
  angS+=0.6;
  if(angS==360)angS=0;
  
  pushMatrix();
  translate(width/5,0,0);
  rotateX(radians(angPl));
  shape(planetaTierra);
  rotateY(radians(angPl*(-2)));
  textSize(30);
  text("Tierra", -35, -60);
  popMatrix();
  angPl+=0.5;
  if(angPl==360)angPl=0;
  
  pushMatrix();
  translate(width/6,0,0);
  rotateY(radians(angPl));
  rotateX(radians(angPl));
  translate(-2*width/6,0,0);
  shape(planetaRoca);
  rotateX(radians(angPl*(-2)));
  textSize(30);
  text("Roca", -35, -60);
  popMatrix();
  
  pushMatrix();
  translate(-150,-300,0);
  rotateX(radians(angPl));
  translate(300,375,0);
  shape(planetaArena);
  rotateY(radians(angPl*(-1)));
  textSize(30);
  text("Arena", 15, -35);
  popMatrix();
  
  pushMatrix();
  translate(0,0,-400);
  rotateX(radians(angPl));
  rotateY(radians(angPl));
  translate(50,150,500);
  shape(planetaLava);
  rotateY(radians(angPl*(-2)));
  textSize(30);
  text("Lava", -15, 60);
  popMatrix();
  
}
