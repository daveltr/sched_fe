App.ApplicationController = Ember.ArrayController.extend
  content: []

App.IndexController = Ember.ObjectController.extend
  content: []

App.BusinessDayController = Em.ObjectController.extend
  needs: ['index']
  content: null
  event_date: ( -> 
    v=@.get('controllers.index.content.sched_date')
    console?.log("changed ev date:#{v}")
    return moment.utc(v).format("YYYY-MM-DD")
  ).property('controllers.index.content.sched_date')