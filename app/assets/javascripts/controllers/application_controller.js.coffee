App.ApplicationController = Ember.ArrayController.extend
  content: []

App.IndexController = Ember.ObjectController.extend
  content: []

App.SchedTourController = Em.ObjectController.extend
  content: []
  selectTimeSlot: (ts) ->  
    return false if @.get('business_day.canSchedule')==false
    sct = @.get('content.scheduled_tour')
    acct = @.get('content.account')
    #get the account product-line
    sct.set('productline', '6')
    #set the sched-date time
    sct.set('sched_date', @.get('event_date'))
    sct.set('sched_date_time', ts.data.id)
    sct.set('timezone', @.get('content.timezone'))
    #calculate the rep to choose


App.BusinessDayController = Em.ObjectController.extend
  content: []