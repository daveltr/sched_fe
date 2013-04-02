App.ApplicationController = Ember.ArrayController.extend
  content: []

App.IndexController = Ember.ObjectController.extend
  content: []
  rdrItem: ->
    console?.log 'rdr ctrl'
    # @.get('route').rdrItem()
    # @.render('business_day', {outlet: 'busday'})
  
App.BusinessDayController = Em.ObjectController.extend
  needs: ['index']
  content: null
  event_date: ( -> 
    v=@.get('controllers.index.content.sched_date')
    console?.log("changed ev date:#{v}")
    return v
  ).property('controllers.index.content.sched_date')