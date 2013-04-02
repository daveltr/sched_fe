App.SchedTour = Em.Object.extend
  timezone: "Eastern Time (US & Canada)"
  sched_date: new Date()
  productline: null
  rep_username: null
  notify: "Product Specialist"


App.SchedTour.reopenClass
  findOrCreate: (account_id, order_id) ->
    console?.log("FoC")

