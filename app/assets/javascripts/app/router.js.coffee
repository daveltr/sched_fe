# App.Router = Ember.Router.extend
#   enableLogging: true
# App = window.App
App.Router.map (match) ->
  @route 'index', path: '/'
  @route 'sched_tour', path: '/:account_id/:order_id'