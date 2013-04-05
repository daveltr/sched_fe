App.SchedTour = Em.Object.extend
  timezone: "Eastern Time (US & Canada)"
  sched_date: null
  # sched_dateBinding:  'controller.content.event_date' #moment.utc().format("YYYY-MM-DD")
  sched_date_time: null
  productline: null
  rep_username: null
  notify: "Product Specialist"
  account: null

  # business_day: ( ->
  #   # create the business day 
  #   # this gets re-created each time the sched_date changes (setting the event_date)
  #   App.BusinessDay.create({event_date: @.get('sched_date') })
    
  #   ).property('sched_date')


App.SchedTour.reopenClass
  findOrCreate: (account_id, order_id) ->
    console?.log("FoC")

