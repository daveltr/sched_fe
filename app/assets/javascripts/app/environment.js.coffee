window.App = Ember.Application.create
  # rootElement: '#app_container'
  LOG_TRANSITIONS: true
  LOG_BINDINGS: true 
  tz_options: [
    "Eastern Time (US & Canada)",
    "Central Time (US & Canada)",
    "Mountain Time (US & Canada)",
    "Pacific Time (US & Canada)",
    "Hawaii",
    "Alaska" 
  ]
  ready: ->
    console?.log("app ready")

# $ ->
#   console?.log('doc ready')