window.App = Ember.Application.create
  # rootElement: '#app_container'
  LOG_TRANSITIONS: true
  tz_options: [
    "Bermuda Time"
    "Eastern Time (US & Canada)",
    "Mountain Time"
  ]
  ready: ->
    console?.log("app ready")

# $ ->
#   console?.log('doc ready')