// On document ready:

$(function(){

	// Instantiate MixItUp:

	$('#Container').mixItUp();

  // Attach navbar to top
  
  $('#nav').affix({
    offset: {
      top: $('.hcontainer').height()
    }
  });

});
