module = angular.module 'rmHoldButton', []

module.directive 'rmOnhold', ->
  restrict: 'A'
  link: (scope, button, attrs) ->
    $button = $(button)

    $fill = $ '<span></span>', class: 'fill'
    $text = $ '<span></span>', class: 'text', text: $button.text()
    $text.width $button.outerWidth()

    $button.prepend $fill
    $fill.prepend $text

    $button.on 'mouseup mouseleave', ->
      $('.fill').stop()
      $('.fill').animate { width: 0 }, 250

    $button.mousedown ->
      $('.fill').stop()
      $('.fill').animate { 'width': '100%' }, 1000, 'linear', ->
        scope.$apply ->
          scope.$eval(attrs.rmOnhold)
