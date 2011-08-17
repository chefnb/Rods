class Rod {
  PVector midpoint;
  float theta;
  int rlen;
  
  Rod(PVector midpoint, float theta, int rlen) {
    
    this.midpoint=midpoint; 
    this.theta=theta;
    this.rlen=rlen;
   }


  void draw() 
  {        
    pushMatrix();
    translate(midpoint.x,midpoint.y);
    rotate(-theta);
    line(rlen/2,0,-rlen/2,0);
    
    ellipse(0,0,rlen,rlen/5);
    
    popMatrix(); 
     }
    
      
   void highlight(){   
    stroke(255);
    this.draw(); 
   }
    
     float distance_from_mouse() {
             
        PVector b = new PVector(rlen*cos(theta),-rlen*sin(theta));
        
        float rodend_x=midpoint.x-0.5*b.x;
        float rodend_y=midpoint.y-0.5*b.y;
       
        PVector a = new PVector(mouseX-rodend_x,mouseY-rodend_y);  // mouse-to-rodend vector
       
        
        if (a.dot(b)<0) return a.mag();
        if (a.dot(b)>b.dot(b)) return a.dist(b);
        
        return a.cross(b).mag()/b.mag();
           
       
       
      }
      
      void move(){
      
      midpoint.x=mouseX;
      midpoint.y=mouseY; 
      
      }
      
      void orient(){
      theta= atan(-(midpoint.y-mouseY)/(midpoint.x-mouseX));
      }
      
     
}


