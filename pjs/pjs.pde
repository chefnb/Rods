/**********************
* 2d liquid crystal
* 
* (c) Nick Braun 2010
* 
***********************/
 
PImage frame;
ArrayList nematic_particle_ensemble;
NematicSimulation simulation_engine;
RodCanvas canvas;
ClearButton clear_btn;
// MuzakButton muzak_btn;

int width=500;
int height=250;


void setup(){
  frameRate(30);
  size(width,height);
  stroke(200);
  noFill();
  ellipseMode(CENTER);
  
  frame = loadImage("img/frame.gif"); 
   
  clear_btn = new ClearButton(450, 200);
//  muzak_btn = new MuzakButton(32, 208);
  
  nematic_particle_ensemble = new ArrayList();  
  canvas= new RodCanvas(nematic_particle_ensemble,40); //RodCanvas(rod ensemble,rod length)
  
  simulation_engine = new NematicSimulation(width,height,nematic_particle_ensemble,50,0.1); 
  // (w,h,rod ensemble,rod length,interaction cutoff,drag)
  

}

void draw(){
  
  background(69,78,99);
 
  simulation_engine.chug();  
  canvas.draw();
  image(frame,0,0);
  clear_btn.draw();
//  muzak_btn.draw();
 
}

// ---------------------------- Javascript interface methods ----------------------------

/*
void toggleEngine(String state){
  if (state=="on")
  simulation_engine.running=true;
  else simulation_engine.running=false;
}
*/
  
void toggleNoise(String state){
  if (state=="on")
  simulation_engine.noiseOn=true;
  else simulation_engine.noiseOn=false;
}

void toggleInteractions(String state){
  if (state=="on")
  simulation_engine.interactionsOn=true;
  else simulation_engine.interactionsOn=false;
}

void setEasyAxis(String key,String new_easy_axis){
 
   AnchoringSurface which_wall=simulation_engine.anchoring_walls.get(key);

    switch(new_easy_axis) {
      case "none":
	 which_wall.isOn=false;
         return;      
      case "vertical":
         which_wall.isOn=true;
         which_wall.easy_axis=0;
        
         return;  

      case "horizontal":
         which_wall.isOn=true;
         which_wall.easy_axis=PI/2;
       }
}


//--------------------------- Events ----------------

void mousePressed() {
  
 canvas.mousePressed();        
  
  if(clear_btn.mouseover) nematic_particle_ensemble.clear();  
 /* if(muzak_btn.mouseover){
           muzak_btn.isOn = !muzak_btn.isOn;  
           toggleSound(muzak_btn.isOn)
        } */

 }

void mouseReleased() {   
  
  canvas.mouseReleased();
     
}


