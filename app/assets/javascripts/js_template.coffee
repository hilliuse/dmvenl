window.DmvEnl ?= {}

DmvEnl.module_name = ( ->

  init: ->
    console.log "Module Init"
    false

)(DmvEnl)


$ ->
  DmvEnl.module_name.init()
