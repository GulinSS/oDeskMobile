'use strict'

### Sevices ###

angular.module('app.services.rest', [])

.service("FindRest", [
  "JobSearchResult"
  "AppLoading"
  "$http"
  (JobSearchResult, AppLoading, $http) ->
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

    getPage = (page) ->
      multiplier = 10
      from = (page-1)*multiplier
      from+";"+multiplier

    @find = (type, skills, page = 1) ->
      AppLoading.show()

      success = (response) ->
        AppLoading.hide()

        return [] if response.data.jobs.job is undefined
        response.data.jobs.job.map (one) ->

          new JobSearchResult
            link: "https://odesk.com/jobs/"+one.ciphertext
            type: one.job_type
            budget: getBudget(one)
            busy: one.op_engagement
            time: one.engagement_weeks
            description: one.op_description

      promise = $http
        method: "GET"
        url: searchJobsUrl
        params:
          qs: skills ?= ""
          t: type ?= ""
          page: getPage page
      promise.then success, ->
        AppLoading.hide()
        alert "Connection error! Check your Internet connection."
])
