#= require 'jquery'
#= require_self
#= require_tree

window.rotate = (a) ->
  a.unshift a.pop()
  a

$(document).ready ->
