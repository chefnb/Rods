
class NematicSimulation {

int w,h;  
float drag;
float cutoff;
ArrayList system;
boolean noiseOn=false;
boolean interactionsOn=false;

	
HashMap anchoring_walls;



  NematicSimulation(int w,int h,ArrayList system,float cutoff, float drag){
  this.w=w;
  this.h=h;
  this.system=system;
  this.cutoff=cutoff;
  this.drag=drag;
  
  anchoring_walls=new HashMap(4);
  
  anchoring_walls.put("right", new RightWall(PI/2,false,w));
  anchoring_walls.put("top", new TopWall(0,false));
  anchoring_walls.put("bott", new BottomWall(0,false,h));
  anchoring_walls.put("left", new LeftWall(0,false));
 
  }
  
    
    
  
  void chug() {  //iterate
        
        
 // get mean-field on each rod resulting from interactions across system. 
 
    float[] force  = new float[system.size()]; 

    for (int i = system.size()-1; i >= 0; i--) { 
    
      if (interactionsOn) force[i]= mean_field(i); else force[i]=0;
          
    force[i]+=anchoring_field(i);    
     }
       
    // eqn of motion   
       
        for (int i = system.size()-1; i >= 0; i--) { 
    
      Rod particle=(Rod) system.get(i);
     
        particle.theta+=drag*force[i];
        
        if (noiseOn) particle.theta+=drag*random(-1,1);
        
        }
      
  }
  
  float anchoring_field(int i){  
    //  implement r6  anchoring potentials
    float d,v,anchoring_field=0;
    
    Rod particle=(Rod) system.get(i);
      
    
    Iterator k = anchoring_walls.entrySet().iterator();  // Get an iterator
 
    while (k.hasNext()) {

    Map.Entry me = (Map.Entry)k.next();

    AnchoringSurface wall = (AnchoringSurface) me.getValue();
  
   
   
      if (wall.isOn) {
               wall.particle_coords=particle.midpoint;
        
               d=wall.distanceTo()/cutoff*2.;  
               if( d>1) v=1/pow(d,12); else v=1;

               float rp=sin(2*(particle.theta-wall.easy_axis));
             //  if (abs(cos(particle.theta-wall.easy_axis))<1e-2) rp+=random(-1,1); //  speed things up if necessary
               anchoring_field+=v*rp;
  
       } 
     }
    return anchoring_field;
     
}
     
     
      
    
  
  float mean_field(int i){  
    // net orientational force on particle i from pairwise Maier-Saupe interactions with rest of system
     float mean_field=0;
     float v; //r6 attractive tail
    
     Rod particle_i=(Rod) system.get(i);
      
     float theta=particle_i.theta;
     PVector posn=PVector.div(particle_i.midpoint,cutoff);           // orientation and (scaled) position of particle i
     
    for (int j = system.size()-1; j >= 0; j--) { // do the sum
      
     if (i!=j){ 
      
     Rod particle_j=(Rod) system.get(j);
     
     float theta_j=particle_j.theta;
     PVector posn_j=PVector.div(particle_j.midpoint,cutoff);
     
     float R_ij=posn.dist(posn_j); // implement cutoff for the r6 tail
     if( R_ij>1) {
      v=1/pow(R_ij,6); 
     }
      else v=1;
     
     mean_field+=v*sin(2*(theta_j-theta));  // NB this is the P_2 derivative
     
     }
     
    }
     return mean_field;
  
      }

}



