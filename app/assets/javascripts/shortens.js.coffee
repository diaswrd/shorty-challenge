# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

onFormSubmit = (ev) ->
    ev.preventDefault();

    sendRequest($(this).attr('action'), $(this).serialize())

sendRequest = (action, data) ->
    $.post(
        action, data
    ).done((res) ->
        console.log(res)
    ).fail((res) ->
        console.log(res)
    );

$(->
    $('form').on('submit', onFormSubmit)
)