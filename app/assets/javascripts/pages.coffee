$ ->
  $("input[type='radio']").on 'click', ->
    if $("input[value='valid']").is(':checked')
      $( ".is-geek" ).fadeIn( "slow" )
    else if !$("input[value='valid']").is(':checked')
      $( ".is-geek" ).fadeOut( "slow" )