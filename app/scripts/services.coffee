'use strict'

### Sevices ###

angular.module('app.services', [])
.service("AppLoading", [
  "$rootScope"
  ($rootScope) ->
    @eventNames =
      show: "appLoading-show"
      hide: "appLoading-hide"

    @show = -> $rootScope.$emit @eventNames.show
    @hide = -> $rootScope.$emit @eventNames.hide
])