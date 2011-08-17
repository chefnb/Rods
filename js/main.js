	$(document).ready(function(){         // GUI setup
 
$( "#accordion" ).accordion({
   	collapsible: true,
	    	autoHeight: false
            });



 $( "#interaction" ).button({
            icons: { primary: "ui-icon-power"  },
            text: false,
            width: 30
          
        });
 $( "#noise" ).button({
            icons: { primary: "ui-icon-power"  },
            text: false,
            width: 30
        });

                 
                    

$.each(anchoring_button, function(key) { 
  anchoring_button[key].init(); 
});


$("#sound").hide();

$("#loading").hide();
$("#curtain").fadeIn(2000);

	
});

var anchoring_button={
   "right": new AnchoringButton("#right"),
   "bott":new AnchoringButton("#bottom"),
   "left": new AnchoringButton("#left"),
   "top":new AnchoringButton("#top")
};
   



// -------------ANCHORING BUTTON CLASS ------------
function AnchoringButton (id) {
    this.id;
    this.bcSet="none";
   
    this.init = function() { // constructor
      this.id=id;
      $(id).button({icons: { primary: "ui-icon-help"  }, text: false, width: 30 });
    }
  
    this.newEasyAxis = function() {
      switch(this.bcSet)
      {
      case "none":
	$(this.id ).button( "option", "icons", {primary:'ui-icon-grip-solid-vertical'} );
        return this.bcSet="vertical";      
      case "vertical":
        $(this.id ).button( "option", "icons", {primary:'ui-icon-grip-solid-horizontal'} );
        return this.bcSet="horizontal";
      case "horizontal":
       $(this.id ).button( "option", "icons", {primary:'ui-icon-help'} );    
       return this.bcSet="none"
      };
     }
}
//--------------------------------


var p;
var noise_on=false;
var interactions_on=false;

//  Calls from Processing



function toggleSound(muzak_on){
 if (muzak_on) $("#sound").show(); else $("#sound").hide();

  }


//  Calls to Processing


function anchoringBtnPressed(key) {
 if (!p)  p = Processing.getInstanceById('pde');  
 p.setEasyAxis(key, anchoring_button[key].newEasyAxis()); 
   
}

function wipe(){
 if (!p)  p = Processing.getInstanceById('pde');  

p.wipe();
  }

function interactionToggle(){

 if (!p)  p = Processing.getInstanceById('pde');  

 if (!interactions_on) {
  
   interactions_on=true;
     $("#interaction_monitor").css('background-color', 'red');
   p.toggleInteractions("on");
   
   } else {

    interactions_on=false;
    $("#interaction_monitor").css('background-color', 'transparent');
     p.toggleInteractions("off");
   
 

   }

}

function noiseToggle(){

 if (!p)  p = Processing.getInstanceById('pde');  

 if (!noise_on) {
  
   noise_on=true;
   $("#noise_monitor").css('background-color', 'red');
   p.toggleNoise("on");
   
   } else {
  
    noise_on=false;
    $("#noise_monitor").css('background-color', 'transparent');
   p.toggleNoise("off");

  
   }
  
}

