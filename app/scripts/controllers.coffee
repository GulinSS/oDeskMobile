'use strict'

### Controllers ###

angular.module('app.controllers', [])

.controller('AppCtrl', [
  '$scope'
  '$location'
  '$resource'
  '$rootScope'

($scope, $location) ->

  # Uses the url to determine if the selected
  # menu item should have the class active.
  $scope.$location = $location
  $scope.$watch('$location.path()', (path) ->
    $scope.activeNavId = path || '/'
  )

  # getClass compares the current url with the id.
  # If the current url starts with the id it returns 'active'
  # otherwise it will return '' an empty string. E.g.
  #
  #   # current url = '/products/1'
  #   getClass('/products') # returns 'active'
  #   getClass('/orders') # returns ''
  #
  $scope.getClass = (id) ->
    if $scope.activeNavId.substring(0, id.length) == id
      return 'active'
    else
      return ''
])

.controller('JobsController', [
  '$scope'
  'FindRest'
  ($scope, FindRest) ->
    page = 1
    $scope.nextPage = ->
      page++
      FindRest.find($scope.type, $scope.skills, page).then (values) ->
        values.forEach (value) ->
          $scope.results.push value

    $scope.findJobs = ->
      FindRest.find($scope.type, $scope.skills, page).then (values) ->
        $scope.results = values
])

