'use strict'

### Models ###

angular.module('app.services.models.result', [])

.factory("JobSearchResult", [
  '$window'
  ($window) ->
    class JobSearchResult
      constructor: (dto) ->
        @link = dto.link
        @type = dto.type
        @budget = dto.budget
        @busy = dto.busy
        @time = dto.time
        @description = dto.description

      go: ->
        $window.open(@link, '_blank', 'location=yes')
])
