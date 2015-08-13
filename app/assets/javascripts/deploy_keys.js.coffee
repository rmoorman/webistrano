# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
ready = ->
  checkbox = $( '#new_deploy_key .control-group .controls input[type=checkbox].deploy_key_auto_generate' )
  checkbox.off( 'click' ).on 'click', ->
    if checkbox.prop 'checked'
      $( '#new_deploy_key .deploy-key-input' ).hide()
    else
      $( '#new_deploy_key .deploy-key-input' ).show()
$( document ).ready ready
$( document ).on 'page:load', ready
