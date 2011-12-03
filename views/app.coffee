$ ->
  $('#menu-twitter').click ->
    pageTracker._trackPageview('outbound/twitter')
    window.open("http://twitter.com/gustavocastro", "_blank")
  $('#menu-facebook').click ->
    pageTracker._trackPageview('outbound/facebook')
    window.open("http://www.facebook.com/goocastro", "_blank")
  $('#menu-linkedin').click ->
    pageTracker._trackPageview('outbound/linkedin')
    window.open("http://www.linkedin.com/in/gustavolcastro", "_blank")
