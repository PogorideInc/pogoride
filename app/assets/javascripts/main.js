// On document ready:

$(function(){

	// Instantiate MixItUp:

	$('#Container').mixItUp();

  $('#nav').affix({
    offset: {
      top: $('.hcontainer').height()
    }
  });
  
});
