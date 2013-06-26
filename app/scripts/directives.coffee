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