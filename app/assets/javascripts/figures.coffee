class window.Validate
  @fourCoordIsSet: (coord_x, coord_y, coord_x1, coord_y1) ->
    coord_x != '' && coord_y != ''  && coord_x1 != '' && coord_y1 != ''

  @segment: (form) ->
    coord_x = form.find('input[name="figures[segments][x][]"]').val()
    coord_y = form.find('input[name="figures[segments][y][]"]').val()
    coord_x1 = form.find('input[name="figures[segments][x1][]"]').val()
    coord_y1 = form.find('input[name="figures[segments][y1][]"]').val()

    unless Validate.fourCoordIsSet(coord_x, coord_y, coord_x1, coord_y1)
      return true

    if coord_x == coord_x1 && coord_y == coord_y1
      false
    else
      true

  @rectangle: (form)->
    coord_x = form.find('input[name="figures[rectangles][x][]"]').val()
    coord_y = form.find('input[name="figures[rectangles][y][]"]').val()
    coord_x1 = form.find('input[name="figures[rectangles][x1][]"]').val()
    coord_y1 = form.find('input[name="figures[rectangles][y1][]"]').val()

    unless Validate.fourCoordIsSet(coord_x, coord_y, coord_x1, coord_y1)
      return true

    if coord_x == coord_x1 || coord_y == coord_y1
      false
    else
      true

  @allRectangles: ->
    form = $('.js-compare-form')
    rectangle_forms = form.find('.js-rectangle-form')

    valid = true
    $.each(rectangle_forms, (_k, form) ->
      unless Validate.rectangle($(form))
        return valid = false
    )

    valid

  @allSegments: ->
    form = $('.js-compare-form')
    segment_forms = form.find('.js-segment-form')

    valid = true
    $.each(segment_forms, (_k, form) ->
      unless Validate.segment($(form))
        return valid = false
    )

    valid

$ ->

  $('.js-compare-form').on 'submit', ->
    unless $('.figure-form').length > 1
      alert('Need to choose minimun 2 figures')
      false

  $('a.js-add-figure').on 'click', (e) ->
    e.preventDefault()

    $link = $(this)
    $.ajax
      url: $link.attr('href')
      method: 'GET'
      dataType: 'JSON'
      success: (data) ->
        $('.js-compare-form ul').append("<li>#{data.html}</li>")

  $('.js-dashboard').on 'click', '.js-remove-form', ->
    $(this).closest('li').remove()


  $('.js-dashboard').on 'change', 'input[name^="figures[segments]"]', ->
    unless Validate.segment($(this).closest('.js-segment-form'))
      $('input[type="submit"]').prop('disabled', true);
      alert('Segments coords is not valid')

    # enable button only if rectangles and segments are valid
    if Validate.allRectangles() && Validate.allSegments()
      $('input[type="submit"]').prop('disabled', false);

  $('.js-dashboard').on 'change', 'input[name^="figures[rectangles]"]', ->
    unless Validate.rectangle($(this).closest('.js-rectangle-form'))
      $('input[type="submit"]').prop('disabled', true);
      alert('Rectangles coords should be placed by diagonal')

    # enable button only if rectangles and segments are valid
    if Validate.allRectangles() && Validate.allSegments()
      $('input[type="submit"]').prop('disabled', false);

