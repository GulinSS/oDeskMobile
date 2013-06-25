'use strict'

angular.module('app.models', [])

# Declare app level module which depends on filters, and services
App = angular.module('app', [
  'ngCookies'
  'ngResource'
  'app.controllers'
  'app.directives'
  'app.filters'
  'app.services'
  'app.models'
  'partials'
])

App.config([
  '$routeProvider'
  '$locationProvider'

($routeProvider, $locationProvider, config) ->

  $routeProvider

    .when('/jobs', {templateUrl: '/partials/jobs.html'})

    # Catch all
    .otherwise({redirectTo: '/jobs'})

  # Without server side support html5 must be disabled.
  $locationProvider.html5Mode(false)
])
