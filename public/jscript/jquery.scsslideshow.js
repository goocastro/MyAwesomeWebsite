/**
 * jQuery scsSlideshow plugin
 * @name jquery-scsslideshow.js
 * @author Pascal (Scalpweb) Mugnier - http://www.pascalmugnier.com
 * @version 0.5
 * @date March 17, 2011
 * @category jQuery plugin
 * @copyright (c) 2011 Pascal (Scalpweb) Mugnier (www.pascalmugnier.com)
 * @license Creative Commons http://creativecommons.org/licenses/by/3.0/
 * @example Please visit http://www.pascalmugnier.com/jQuery-plugin-slideshow.html
 */

$.fn.scsSlideshow = function(options)
{  
	// --
	// -- Options :
	// --
	var prefix = 'scsSlideshow_';
	var defaults = {  
			delayBetweenImage: 5000,
			delayTransition: 800,
			legend: false,
			legendHeight: 0,
			slideshowWidth: 500,
			slideshowHeight: 500
		};
	var options = $.extend(defaults, options);
	
	// --
	// -- For each targets :
	// --
	return this.each(
		function()
		{
			var obj = $(this);
			var current = 0;
			var li = new Array();
			// -- We will only with UL element :
			if(obj.is('ul'))
			{
				// -- Applying css :
				obj.css('width', options.slideshowWidth);
				obj.css('height', options.slideshowHeight);
				obj.addClass('scssBox');
				obj.append('<li class="legend" style="margin-top: -'+options.legendHeight+'px; height: '+options.legendHeight+'px;"></div>');
				// -- We look for every images :
				obj.find('li').each(
									function()
									{
										li.push($(this));
										$(this).hide();
									}
								);
				// -- And then we resize and show the first image :
				if(obj.find('li').size() > 0)
				{
					__display(obj, li[0]);
					setInterval(function(){
											li[current].fadeOut(options.delayTransition);
											current ++;
											if(current > li.length-2)
												current = 0;
											__display(obj, li[current]);
										},
									options.delayBetweenImage);
				}
				// -- And that's it ;-)
			}
		}
	);
	
	// --
	// -- Displaying image :
	// --
	function __display(ul, li)
	{
		// -- Displaying :
		li.fadeIn(options.delayTransition);
		if(li.attr('title') != '' && options.legend)
		{
			$('li.legend', ul).html('<span>'+li.attr('title')+'</span>');
			$('li.legend', ul).show();
		}
		else
			$('li.legend', ul).hide();
	}
	
}; 