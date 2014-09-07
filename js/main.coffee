---
---

$(document).ready ->
  $("#navicon").sidr({
    onOpen: ->
      $("#navicon").removeClass()
    ,
    onClose: ->
      $("#navicon").addClass "closed"
  })
  
  $("#sidr a").click ->
    klass = $(this).attr('class')

    $("##{klass}").velocity "scroll", { duration: 1800, easing: "easeInOutElastic" }
    $.sidr 'close', 'sidr'

  $(".chevron .down").click ->
    $("#about").velocity "scroll", { duration: 1300, easing: "easeInOutElastic" }

  mobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)

  if $("html").hasClass("cssanimations") and not mobile


    #'#about p', 'fadeInUp', '.column', 'fadeInUp', 
    #'.item', 'fadeInDown', '.bar', 'fadeInRight',
    #'.paperplane', 'bounceInDown', '#quote .content', 'fadeIn',
    #'#quote .icon', 'fadeInDown'

    animate = (animation) ->
      $(animation[0]).addClass("concealed").viewportChecker({
        classToAdd: "visible animated #{animation[1].trim()}",
        offset: 200
      })

    items = [
        ['#about p', 'fadeInUp'], ['.column', 'fadeInUp'], 
        ['.item', 'fadeInDown'], ['.bar', 'fadeInRight'],
        ['.paperplane', 'bounceInDown'], ['#quote .container', 'fadeIn'],
        ['#quote .icon', 'fadeInDown']
      ]

    for item in items
      animate item

  $("#footer ul li").hover ->
    $(this).find('p').stop(true, true).fadeIn(800)
  , ->
    $(this).find('p').stop(true, true).fadeOut(800)
