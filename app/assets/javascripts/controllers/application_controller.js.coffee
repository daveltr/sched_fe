App.ApplicationController = Ember.ArrayController.extend
  content: []

App.IndexController = Ember.ObjectController.extend
  content: []

App.SchedTourController = Em.ObjectController.extend
  content: []
  selectTimeSlot: (ts) ->  
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
  # needs: ['index']
  content: []

  # event_dateBinding: 'controllers.index.content.event_date'
  # contentBinding: 'controllers.index.content.business_day'



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
