class AnchoringSurface{
  boolean isOn;
  float easy_axis;
  PVector particle_coords;
  
  AnchoringSurface() { }
  float distanceTo() {
    return 0;
  }
}


   

class LeftWall extends AnchoringSurface {
    
  LeftWall(float easy_axis,boolean isOn) {
    this.easy_axis = easy_axis;
    this.isOn = isOn;
  }
  
 float distanceTo() {
  
  return particle_coords.x; 
 }
  
}  

class RightWall extends AnchoringSurface{
  
   int w;
  
  RightWall(float easy_axis,boolean isOn,int w) {
    this.easy_axis = easy_axis;
    this.isOn = isOn;
    this.w=w;
  }
  
  float distanceTo() {
  
  return w-particle_coords.x; 
 }
  
}  
class TopWall extends AnchoringSurface {
  
  
  TopWall(float easy_axis,boolean isOn) {
    this.easy_axis = easy_axis;
    this.isOn = isOn;
  }
  
  float distanceTo() {
  
  return particle_coords.y; 
 }
  
  
}  

class BottomWall extends AnchoringSurface{
  
   int h;
  
  BottomWall(float easy_axis,boolean isOn,int h) {
    this.easy_axis = easy_axis;
    this.isOn = isOn;
    this.h=h;
  }
  
  float distanceTo() {
  
  return h-particle_coords.y;
 }
  
}  
 

