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
  $('#menu-work').click ->
    pageTracker._trackPageview('outbound/theauberginepanda')
    window.open("http://www.theauberginepanda.com", "_blank")


  $(document).scroll ->
    if $(document).height() - ($(window).scrollTop() + $(window).height()) <= 0
      $.get('/more', (data) ->
        $("#main").append(data)
      )


  over = ->
    path = $("> img", this).attr 'src'
    $("> img", this).attr('src', path.replace(/out/i, "over"))
  out = ->
    path = $("> img", this).attr 'src'
    $("> img", this).attr('src', path.replace(/over/i, "out"))

  $(".icon").hover(over, out)

  $(".profile-picture").twipsy(
    live:true
    offset:5
  )
