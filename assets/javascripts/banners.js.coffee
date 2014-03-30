require ["delay_loop"], (util)->

  banners = $('#banner .banner').toArray()

  rotate = (ary, direction = 'forward') ->
    switch direction
      when 'forward'
        ary.push ary.shift()
      when 'back'
        ary.unshift ary.pop()
    ary

  remove = (arr, item) ->
    $.each arr, (index, value) ->
      if value == item
        arr.splice(index, 1)

  cycle_banners = (direction = 'forward')->
    banner = rotate(banners, direction).slice(0).pop()
    showBanner banner

  showBanner = (banner)->
    $.each banners, (i, element) ->
      $(element).removeClass('active')
    $(banner).addClass('active')

  startCyclingBanners = ->
    stopCyclingBanners()
    cycle_banners()
    delayRunners.push cycle_banners

  stopCyclingBanners = ->
    remove delayRunners, cycle_banners

  window.nextBanner = ->
    stopCyclingBanners()
    cycle_banners('forward')

  window.previousBanner = ->
    stopCyclingBanners()
    cycle_banners('back')

  startCyclingBanners()