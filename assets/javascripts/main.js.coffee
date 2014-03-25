#= require_self
#= require_tree

window.rotate = (a) ->
  a.push a.shift()
  a
