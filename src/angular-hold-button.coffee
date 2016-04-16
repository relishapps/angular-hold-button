module = angular.module 'rmHoldButton', []

module.directive 'rmOnhold', ['$parse', ($parse) ->
  restrict: 'A'
  link: (scope, button, attrs) ->
    $button = $ button

    $button.addClass 'rm-hold-button'

    options = ($parse attrs.rmOnholdOptions)() ? {}
    options.duration ?= 1000

    $fill = $ '<span></span>', class: 'rm-hold-button-fill'
    $text = $ '<span></span>', class: 'rm-hold-button-text', text: $button.text()
    $text.css 'lineHeight', $button.innerHeight() + 'px'
    $text.width $button.outerWidth()

    $button.prepend $fill
    $fill.prepend $text

    $button.on 'mouseup mouseleave', ->
      $('.rm-hold-button-fill').stop()
      $('.rm-hold-button-fill').animate { width: 0 }, 250

    $button.mousedown ->
      $('.rm-hold-button-fill').stop()
      $('.rm-hold-button-fill').animate { 'width': '100%' }, options.duration, 'linear', ->
        scope.$apply ->
          scope.$eval(attrs.rmOnhold)
]