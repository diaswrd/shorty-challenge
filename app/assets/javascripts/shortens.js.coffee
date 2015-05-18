# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

onFormSubmit = (ev) ->
    ev.preventDefault();

    sendRequest($(this).attr('action'), $(this).serialize())

showSuccessMessage = (response) ->
    $('.feedback > div').empty()

    url = window.location.href + response.shortcode
    $('.feedback .success').html("Success! Your shortened URL is <a href='#{url}'>#{url}</a>")

showErrorMessage = (response) ->
    $('.feedback > div').empty()

    error = response.responseJSON.message
    $('.feedback .error').text("#{error}")

sendRequest = (action, data) ->
    $.post(
        action, data
    ).done(
        showSuccessMessage
    ).fail(
        showErrorMessage
    );

$(->
    $('form').on('submit', onFormSubmit)
)