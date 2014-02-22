#= require 'jquery'
#= require 'jquery-scrollspy-thesmart/scrollspy'
#= require_self
#= require_tree

$(document).ready ->
  $('.container').on 'scrollSpy:enter', ->
    console.log 'enter:', $(this).attr('id')
  return null
