module = angular.module 'rmHoldButton', []

module.directive 'rmOnhold', ['$parse', ($parse) ->
  restrict: 'A'
  link: (scope, button, attrs) ->
    $button = $ button

    options = ($parse attrs.rmOnholdOptions)() ? {}
    options.duration ?= 1000

    $fill = $ '<span></span>', class: 'fill'
    $text = $ '<span></span>', class: 'text', text: $button.text()
    $text.css 'lineHeight', $button.innerHeight() + 'px'
    $text.width $button.outerWidth()

    $button.prepend $fill
    $fill.prepend $text

    $button.on 'mouseup mouseleave', ->
      $('.fill').stop()
      $('.fill').animate { width: 0 }, 250

    $button.mousedown ->
      $('.fill').stop()
      $('.fill').animate { 'width': '100%' }, options.duration, 'linear', ->
        scope.$apply ->
          scope.$eval(attrs.rmOnhold)
]