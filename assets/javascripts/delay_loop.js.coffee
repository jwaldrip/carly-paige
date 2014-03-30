window.delayRunners = []

window.startDelayLoop = (ms)->
  delayLoop = ->
    $.each delayRunners, (index, job)->
      job()
    setTimeout delayLoop, ms
  delayLoop()

startDelayLoop(5000)
