'use strict'

### Directives ###

# register the module with Angular
angular.module('app.directives', [])

.directive("appLoading", [
  "$rootScope"
  ($rootScope) ->
    (scope, element) ->
      $rootScope.$on "appLoading-show", ->
        element.css display: "block"
      $rootScope.$on "appLoading-hide", ->
        element.css display: "none"
  ])