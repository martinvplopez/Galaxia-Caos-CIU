// Class that represents any astronomical entity (planet, satellite, etcetera).

class AstroObject{
  int rad;
  int rotationAxis=0; // Sets the axis the object is rotating from. 1-x, 2-y, 3-z
  float rotationAngle;
  float rotationAngle2=0;
  float translationAngle;
  int posX=0,posY=0,posZ=0;
  AstroObject(int _rad,float _rotationAngle, int _rotationAxis){
    rad=_rad;
    rotationAngle=_rotationAngle;
    rotationAxis=_rotationAxis;
  }  
  // Function that displays the object
  void show(int x, int y, int z){
    pushMatrix();
    rotateX(rotationAngle);
    switch(rotationAxis){
      case 1: 
        rotateX(rotationAngle2);
        break;
      case 2: 
        rotateY(rotationAngle2);
        break;
      case 3: 
        rotateZ(rotationAngle2);
        break;
    }
    rotationAngle2+=rotationAngle2;
    translate(x,y,z);
    sphere(rad);
    popMatrix();
  }
  
  void setRot(float _rotationAngle2){
    rotationAngle2=_rotationAngle2;
  }
    



}
