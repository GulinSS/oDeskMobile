'use strict'

### Sevices ###

angular.module('app.services.rest', [])

.service("FindRest", [
  "JobSearchResult"
  "$http"
  (JobSearchResult, $http) ->
    searchJobsUrl = "https://www.odesk.com/api/profiles/v1/search/jobs.json"

    getBudget = (one) ->
      if one.job_type is "Hourly"
        if one.hours_per_week
          one.hours_per_week+"h/w"
        else undefined
      else if one.job_type is "Fixed"
        if one.amount
          one.amount+"$"
        else undefined
      else throw new Error "Unknown type of job"

    @find = (type, skills) ->
      promise = $http
        method: "GET"
        url: searchJobsUrl
        params:
          qs: skills ?= ""
          t: type ?= ""
      promise.then (response) ->
        response.data.jobs.job.map (one) ->

          new JobSearchResult
            link: "https://odesk.com/jobs/"+one.ciphertext
            type: one.job_type
            budget: getBudget(one)
            busy: one.op_engagement
            time: one.engagement_weeks
            description: one.op_description
])
