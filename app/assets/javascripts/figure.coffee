$ ->
  $('a.js-add-figure').on 'click', (e) ->
    e.preventDefault()

    $link = $(this)
    $.ajax
      url: $link.attr('href')
      method: 'GET'
      dataType: 'JSON'
      success: (data) ->
        $('.js-compare-form ul').append("<li>#{data.html}</li>")
