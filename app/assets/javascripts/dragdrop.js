var counter = 0;
$(document).ready(function() {
		 $("#accordion div").draggable({ 
		 	connectToSortable: '#myList',
		 	cursor: "move",	
		 	helper:'clone' ,
		 	opacity: 0.6
		 	
    });


// $("#accordion div").clone().attr('id', counter).appendTo('body');


         $( "#accordion" ).disableSelection();
		 

		 $("#myList").sortable({
		 	placeholder: "ui-state-highlight",
		 start: function (event, ui) {
            ui.item.css('border', '2px solid black').append('<span class="ui-icon ui-icon-arrow-4 icons"></span>');
            // ui.item.css('cursor','move');
        },
        stop: function (event, ui) {
            //reset to no border or whatever your desired default border is
            ui.item.addClass('demo1');

            ui.item.children('.icons').remove();
        },
        
        over: function () {
                removeIntent = false;
            },
            out: function () {
                removeIntent = true;
            },
            
            beforeStop: function (event, ui) {
                    newItem = ui.item;
                    if(removeIntent == true){
                    ui.item.remove();   
                }
            }, 
            receive: function (event , ui){
            	oldItem = ui.item;
            	no_val = $(oldItem).attr('id')+'-'+counter;
            	// alert(no_val);
            	counter++;
            	$(newItem).attr('id', no_val);
            }                     

		 	
		 });
		
   // $('#myList').click(function() {
   //       $('#big-form').removeClass( "hidden" );
   //  });
   // $("#myList > li").click(function() { 
   // 	alert("hurray");
   // }); 
$( "#myList > div" ).click(function() {
   alert($(this).text() + " clicked!");
 
  });

});




 