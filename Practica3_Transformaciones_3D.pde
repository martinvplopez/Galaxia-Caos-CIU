// Martín van Puffelen López

float ang,angS,angPl;
PImage agua, sol, lava, arena, tierra, luna, roca, galaxy;
PShape satAgua, satSol, planetaLuna, satLava, satArena, planetaTierra, satRoca;
int posX,posY,posZ;
boolean sat,plan;
int satVisib, planVisib, cuerposVisib;

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
  
  satAgua= setShapeObj(satAgua, agua, 20);
  planetaLuna= setShapeObj(planetaLuna, luna, 50);
  planetaTierra= setShapeObj(planetaTierra, tierra, 60);
  satSol= setShapeObj(satSol, sol, 10);
  satLava= setShapeObj(satLava, lava, 35);
  satArena= setShapeObj(satArena, arena, 30);
  satRoca= setShapeObj(satRoca, roca, 46);
  sat=true;
  plan=true;
  satVisib=5;
  planVisib=2;
  cuerposVisib=0;
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
  fill(255);
  textSize(30);
  text("Galaxia Caótica",20,50);
  textSize(20);
  text("¡Donde casi hay colisiones!\nProbabilidad de supervivencia: 0.2%",20,80);
  cuerposVisib=satVisib+planVisib;
  text("Cuerpos celestes reconocidos: " + cuerposVisib, 210,725);
  noFill();
  stroke(255);
  strokeWeight(2);
  rect(22,680,155,30);
  rect(22,725,155,30);
  if(plan){
      text("Ocultar planetas",30,700);
      planVisib=2;
  }else{
    text("Mostrar planetas",30,700);
    planVisib=0;
  }
  if(sat){
      text("Ocultar satélites",30,745);
      satVisib=5;
  }else{
      text("Mostrar satélites",30,745);    
      satVisib=0;      
  }

  rotateX(radians(-40));
  translate(width/2,height/2,0);
  pushMatrix();
  rotateY(radians(ang));
  if(plan){
    shape(planetaLuna);
  }
    rotateX(radians(ang*(-2)));
  if(plan){
    textSize(30);
    text("Platoon", -15, -60); // Planeta
  }
  translate(-width*0.1,0,0);
  if(sat) shape(satAgua);
  rotateZ(radians(ang*(-1)));
  if(sat){
    textSize(20);
    text("Wat", -15, -20);
  }
  popMatrix();
  ang+=0.4;
  if(ang==360)ang=0;
  
  pushMatrix();
  rotateZ(radians(angS));
  translate(-width*0.1,0,0);
  if(sat) shape(satSol);
  rotateZ(radians(angPl*(-2)));
  if(sat) {
    textSize(30);
    text("Cream", -15, -20);
  }
  popMatrix();
  angS+=0.6;
  if(angS==360)angS=0;
  
  pushMatrix();
  translate(width/5,0,0);
  rotateX(radians(angPl));
  if(plan) shape(planetaTierra);
  rotateY(radians(angPl*(-2)));
  if(plan){
    textSize(30);
    text("Aard", -35, -60); 
  }
  popMatrix();
  angPl+=0.5;
  if(angPl==360)angPl=0;
  
  pushMatrix();
  translate(width/6,0,0);
  rotateY(radians(angPl));
  rotateX(radians(angPl));
  translate(-2*width/6,0,0);
  if(sat)  shape(satRoca);
  rotateX(radians(angPl*(-2)));
  if(sat){ 
    textSize(30);
    text("Stone", -35, -60);
  }
  popMatrix();
  
  pushMatrix();
  translate(-150,-300,0);
  rotateX(radians(angPl));
  translate(300,375,0);
  if(sat) shape(satArena);
  rotateY(radians(angPl*(-1)));
  if(sat) {
    textSize(30);
    text("Sand", 15, -35);
  }
  popMatrix();
  
  pushMatrix();
  translate(0,0,-400);
  rotateX(radians(angPl));
  rotateY(radians(angPl));
  translate(50,150,500);
  if(sat) shape(satLava);
  rotateY(radians(angPl*(-2)));
  if(sat) {
    textSize(30);
    text("Magma", -15, 60);
  }
  popMatrix();
}


void mousePressed(){
  // Click show planets
  if (mouseX>=22 && mouseX<=177 && mouseY>=680 && mouseY<=710){
    if(plan){
      plan=false;
    }else{
      plan=true;
    }
  }
  // Click show satellites
  if (mouseX>=22 && mouseX<=177 && mouseY>=725 && mouseY<=755){
    if(sat){
      sat=false;
    }else{
      sat=true;
    }
  }
}
