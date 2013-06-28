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
        element.css marginBottom: "0px"
      $rootScope.$on AppLoading.eventNames.hide, ->
        element.css marginBottom: "-50px"
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