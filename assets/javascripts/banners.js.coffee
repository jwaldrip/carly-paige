require ["delay_loop"], (util)->

  banners = $('#banner .banner').toArray()

  rotate = (ary) ->
    ary.push ary.shift()
    ary

  remove = (arr, item) ->
    $.each arr, (index, value) ->
      if value == item
        arr.splice(index, 1)

  cycle_banners = ->
    showBanner rotate(banners).slice(0).pop()

  showBanner = (banner)->
    $.each banners, (i, element) ->
      $(element).removeClass('active')
    $(banner).addClass('active')

  stayOnBanner = (banner)->
    remove window.delayRunners, cycle_banners
    showBanner(banner)

  delayRunners.push cycle_banners