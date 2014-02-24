backgrounds = [1, 2, 3]

window.cycle_image = ->
  sbkgs = rotate(backgrounds).slice(0)
  actbkg = sbkgs.pop()
  $('.background').addClass('background-' + actbkg)
  $.each sbkgs, (index, value)->
    $('.background').removeClass('background-' + value)

window.delayLoop = (ms, func)->
  runner = ->
    func()
    delayLoop(ms, func)
  setTimeout runner, ms