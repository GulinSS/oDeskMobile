'use strict'

### Directives ###

# register the module with Angular
angular.module('app.directives', [])

.directive("appLoading", [
  "AppLoading"
  "$rootScope"
  (AppLoading, $rootScope) ->
    (scope, element) ->
      $rootScope.$on AppLoading.eventNames.show, ->
        element.css display: "block"
      $rootScope.$on AppLoading.eventNames.hide, ->
        element.css display: "none"
  ])

.directive("appScrollPage", [
  "$window"
  ($window) ->
    (scope, element, attrs) ->
      appScrollPage = scope.$eval attrs.appScrollPage
      $window.onscroll = ->
        scrollTop = $window.pageYOffset || $window.document.documentElement.scrollTop
        height = $window.document.height
        deviceHeight = $window.document.documentElement.clientHeight

        if (scrollTop + deviceHeight) > height
          appScrollPage()
])