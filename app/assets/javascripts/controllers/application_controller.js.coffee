App.ApplicationController = Ember.ArrayController.extend
  content: []

App.IndexController = Ember.ObjectController.extend
  content: []

# All we need to know to create a business_day object is 
# the event_date which we're looking up
# 
App.BusinessDayController = Em.ObjectController.extend
  needs: ['index']
  content: []
  # event_dateBinding: 'controllers.index.content.event_date'
  # contentBinding: 'controllers.index.content.business_day'

###
Return an Object sorted by it's Key
###
App.sortObjectByKey = (obj) ->
  keys = []
  sorted_obj = {}
  for key of obj
    keys.push key  if obj.hasOwnProperty(key)
  
  # sort keys
  keys.sort()
  
  # create new array based on Sorted Keys
  jQuery.each keys, (i, key) ->
    sorted_obj[key] = obj[key]

  sorted_obj



  # event_dateBinding: 'controllers.index.content.sched_date'

  #  # null
  # event_date: ( -> 
  #   v=@.get('controllers.index.content.sched_date')
  #   console?.log("changed ev date:#{v}")
  #   return moment.utc(v).format("YYYY-MM-DD")
  # ).property('controllers.index.content.sched_date')

  # business_day: ( ->
  #   bd = App.BusinessDay.create()
  #   @.set('content',bd) 
  #   bd
  #   ).property('event_date')
  # contentBinding: 'controllers.index.content.business_day'
