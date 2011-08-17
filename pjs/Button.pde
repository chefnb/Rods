class CircleButton
{  
  int x, y;
  int diameter;
  color basecolor, highlightcolor;
  color currentcolor;
  boolean mouseover = false;


CircleButton() { }

CircleButton(int x, int y, int isize, color icolor, color ihighlight) 
  {
    this.x = x;
    this.y = y;
    this.diameter = isize;
    this.basecolor = icolor;
    this.highlightcolor = ihighlight;
    this.currentcolor = icolor;
   
      }


    void draw(){ 
    
    mouseover=checkForMouseover(); 
      
      
    if(mouseover) {
      currentcolor = highlightcolor;
       } 
    else {
      currentcolor = basecolor;
      }
      
    stroke(255);
    fill(currentcolor);
    ellipse(x, y, diameter, diameter);
    fill(0);  
      
    }
    
  
    boolean checkForMouseover(){
    float disX = x - mouseX;
    float disY = y - mouseY;
    if(sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
      return true;
    } 
    else {
      return false;
     }
    }
  
  }



class SquareButton
{  
  int x, y;
  int isize;
  color basecolor, highlightcolor;
  color currentcolor;
  boolean mouseover = false;

SquareButton(int x, int y, int isize, color icolor, color ihighlight) 
  {
    this.x = x;
    this.y = y;
    this.isize = isize;
    this.basecolor = icolor;
    this.highlightcolor = ihighlight;
    this.currentcolor = icolor;
   
      }


 void draw(){ 
    
    mouseover=checkForMouseover(); 
      
    if(mouseover) {
      currentcolor = highlightcolor;
       } 
    else {
      currentcolor = basecolor;
      }
      
    stroke(255);
    fill(currentcolor);
    rect(x, y, isize, isize);
    fill(0);
      
    }


  
  boolean checkForMouseover() 
  {
    if (mouseX >= x && mouseX <= x+isize && 
      mouseY >= y && mouseY <= y+isize) {
      return true;
    } 
    else {
      return false;
    }
  }
}

 class MuzakButton extends CircleButton
{  

  PImage on;
  PImage off;
  boolean isOn=false;
   
  MuzakButton(int x, int y) 
  {
    this.x = x;
    this.y = y;
    
    diameter=25;
    basecolor=color(204);
    highlightcolor=color(153);
    currentcolor=basecolor;  
    off = loadImage("img/off.gif");  
   
    on = loadImage("img/on.gif");  
   
      }
 
   void draw(){ 
    
   super.draw();
   fill(255);
   text("muzak",x-17,y+28);
   if (isOn) image(on,x-8,y-6); else image(off,x-8,y-6); 
    }
  
}

 class ClearButton extends SquareButton
{  

  ClearButton(int x, int y) 
  {
    this.x = x;
    this.y = y;
    isize = 20;
    basecolor=color(204);
    highlightcolor=color(153);
    currentcolor=basecolor;  
      }

 void draw(){ 
    
   super.draw();
   fill(255);
   text("clear",x-5,y+35);
    }
  
}
