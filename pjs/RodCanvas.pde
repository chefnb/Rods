
class RodCanvas {
  
int rlen;  //rod length 
PVector mouse_ref;
boolean mouseover=false;
boolean grip=false;
String gripmode;


ArrayList rods;
Rod selected_rod;


  RodCanvas(ArrayList rods,int rlen){
       
    this.rods=rods;
    this.rlen=rlen;
 
   }


  void draw(){
    noStroke();
    fill(15,52,73);
    for (int i = rods.size()-1; i >= 0; i--) { 
    Rod rod = (Rod) rods.get(i);
   
    rod.draw();
             
 }

     if (grip) updateGrip();
     else mouseover=checkForMouseover();
     
       
}


void updateGrip(){
  
   selected_rod.highlight();
   if (gripmode=="orient") selected_rod.orient(); else  selected_rod.move();
   
  
  
}

boolean checkForMouseover(){
    float min_distance=1e3;
    int nearest_i=-1;
      
    for (int i = rods.size()-1; i >= 0; i--) { 
                           Rod rod = (Rod) rods.get(i);
                           float distance=rod.distance_from_mouse();
                      if (distance< min_distance) {min_distance=distance; nearest_i=i;}
                                 }
 
    if (min_distance<5){                         
                          selected_rod = (Rod) rods.get(nearest_i);
                          selected_rod.highlight();
                          return true;
                        }
       return false;
                 
  }

void mousePressed() {
  
  mouse_ref=new PVector(mouseX,mouseY);
 
  if (!mouseover) return;  
 
  grip=true;   
  if (PVector.dist(selected_rod.midpoint,mouse_ref)<10) gripmode="translate"; else gripmode="orient";
    
 }

void mouseReleased() {    
  
  if (!grip) createRod();
  grip=false;
  
   
}

void createRod(){  
     
  PVector mouse_now;
  PVector mouse_swipe;
  PVector rod_center;
  
    
      mouse_now=new PVector(mouseX, mouseY);
     
     mouse_swipe=PVector.sub(mouse_now,mouse_ref);
     rod_center=PVector.mult(PVector.add(mouse_now,mouse_ref),0.5);
    
  if (mouse_swipe.mag()>5)
   rods.add(new Rod(rod_center,atan(-mouse_swipe.y/mouse_swipe.x),rlen));
   
  }


}

