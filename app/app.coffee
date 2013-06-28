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
  'app.services.rest'
  'app.services.models.result'
  'app.models'
  'partials'
])

App.config([
  '$routeProvider'
  '$locationProvider'
  '$httpProvider'

($routeProvider, $locationProvider, $httpProvider, config) ->

  $routeProvider

    .when('/jobs', {templateUrl: '/partials/jobs.html'})

    # Catch all
    .otherwise({redirectTo: '/jobs'})

  # Without server side support html5 must be disabled.
  $locationProvider.html5Mode(false)

  delete $httpProvider.defaults.headers.common["X-Requested-With"]
])
