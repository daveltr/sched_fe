App.SchedTour = Em.Object.extend
  id: null
  timezone: "Eastern Time (US & Canada)"
  sched_date: null
  sched_date_time: null
  productLineId: null
  rep_username: null
  notify: "Product Specialist"
  account_id: null
  order_id: null
  isDuplicate: false

App.SchedTour.reopenClass
  findOrCreate: (account_id, order_id) ->
    console?.log("FoC")


App.SchedTourData = Em.Object.extend
  event_dateBinding: 'scheduled_tour.sched_date'
  timezoneBinding: 'scheduled_tour.timezone'
  isDuplicateBinding: 'scheduled_tour.isDuplicate'
  productLineIdBinding: 'scheduled_tour.productLineId'
  account_id: null
  order_id: null  
  scheduled_tour: null # App.SchedTour.create()
  account: null #App.Account.create()
  contact: null
  telescriptId: null
  business_day: ( ->
    v = @.get('event_date')
    return null unless v?
    bd = App.BusinessDay.find(v) 
    bd.set("parent", this) 
    return bd
  ).property('event_date')
