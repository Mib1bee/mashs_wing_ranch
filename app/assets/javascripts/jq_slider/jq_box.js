(function($){
	
	$(function(){
		
		/**
		 * Options scroll
		 */
		var scroll_speed = 700;
		// add "back to top" links to category headers
		$('.view-options .view-content h3:not(:first)').append('<a href="" class="back-top">Back to top</a>');
		// click a category link
		$('.block-taxonomy-block a').click(function(){
			// get the index
			var index = $(this).parent().index();
			// scroll to proper section
			$(window).scrollTo($('.view-options .view-content h3').eq(index), scroll_speed);
			return false;
		});
		// click a "back to top" link
		$('.back-top').click(function() {
			$(window).scrollTo(0, scroll_speed);
			return false;
		});
		
		/**
		 * Paypal form submit
		 */
		$('.donate').click(function(){
			$('#donate').click();
			return false;
		});;
		
	});
	
}(jQuery))