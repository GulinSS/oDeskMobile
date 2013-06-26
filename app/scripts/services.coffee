'use strict'

### Sevices ###

angular.module('app.services', [])
.service("AppLoading", [
  "$rootScope"
  ($rootScope) ->
    @show = -> $rootScope.$emit "appLoading-show"
    @hide = -> $rootScope.$emit "appLoading-hide"
])