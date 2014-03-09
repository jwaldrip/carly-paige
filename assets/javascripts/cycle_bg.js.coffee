backgrounds = [1, 2, 3]

window.cycle_image = ->
  sbkgs = rotate(backgrounds).slice(0)
  pickBG(sbkgs.pop())

window.pickBG = (int)->
  $.each backgrounds, (index, value)->
    $('.background').removeClass('background-' + value)
  $('.background').addClass('background-' + int)

window.stayOnBg = (int)->
  window.delayRunners = []
  pickBG(int)

window.delayRunners = []

window.startDelayLoop = (ms, func)->
  delayLoop = ->
    $.each delayRunners, (index, job)->
      job()
    setTimeout delayLoop, ms
  delayLoop()