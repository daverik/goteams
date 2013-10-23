
$(window).scroll(function() {
	if ($(window).scrollTop() < 200) {
		var ypos = $(window).scrollTop();
		$('.logo').css('top', 400 - ypos+10);
		/*$('.compete-section').css('top', 2400 - ypos);
		$('.teams-section').css('top', 2000 - ypos);
		$('.arrow').css('top', 2000 - ypos);*/
	} else {
		var ypos = $(window).scrollTop();
		$('.logo').css('top', ypos+10);
	}
	
});
