App.SchedTour = Em.Object.extend
  timezone: "Eastern Time (US & Canada)"
  sched_date: null
  sched_date_time: null
  productline: null
  rep_username: null
  notify: "Product Specialist"
  account: null

App.SchedTour.reopenClass
  findOrCreate: (account_id, order_id) ->
    console?.log("FoC")


App.SchedTourData = Em.Object.extend
  event_dateBinding: 'scheduled_tour.sched_date'
  timezoneBinding: 'scheduled_tour.timezone'
  account_id: null
  order_id: null
  scheduled_tour: App.SchedTour.create()
  account: App.Account.create()
  business_day: ( ->
    v = @.get('event_date')
    return null unless v?
    bd = App.BusinessDay.find(v) 
    bd.set("parent", this) 
    console?.log(bd.get("parent.timezone") ) #.get('timezone'))
    return bd
  ).property('event_date')
