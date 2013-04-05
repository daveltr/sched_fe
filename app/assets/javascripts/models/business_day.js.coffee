App.BusinessDay = Em.Object.extend
  appointments: []
  time_slots: []
  isLoaded: false

App.BusinessDay.reopenClass
  find: (event_date) ->
    base_url = "http://192.168.11.61:3000/view_schedule"
    uri = "#{base_url}/#{event_date}.json" 
    bd = App.BusinessDay.create()
    $.ajax(
      url: uri
      type: 'GET'
    ).then( (response) ->
      bd.setProperties(response) #App.BusinessDay.create(response) 
      ).then( (bd) ->
        bd.set('ts', Em.A() )#App.SortedArray() )
        slots = Em.A()
        for k,v of bd.time_slots
          console?.log(k)
          slots.push App.TimeSlot.create({key: k, data: v})
        slots.sort (a,b) ->
          console?.log("#{a.key} vs #{b.key}")
          return parseInt(a.key) - parseInt(b.key) 
          # return a.key>b.key? 1 : (a.key<b.key ? -1 : 0); 
        bd.set('ts',slots)
        bd.set('isLoaded',true) 
        return bd
      )
    return bd


App.Account = Em.Object.extend
  name: "daveCo"

App.TimeSlot = Em.Object.extend
  availabe_reps: []

App.RepQueue = Em.Object.extend
  rep_list: []

App.SchedTourData = Em.Object.extend
  event_date: null
  account_id: null
  order_id: null
  scheduled_tour:null
  account: null
  business_day: ( ->
    v = @.get('event_date')
    return null unless v?
    bd = App.BusinessDay.find(v)  
    return bd
  ).property('event_date')

  # business_day: ( ->
  #   v = @.get('event_date')
  #   return null unless v?
  #   bd = App.BusinessDay.find(v)  
  #   # console?.log(@.get('controller'))
  #   # bd.set('event_date', 'controller.event_date')
  #   return bd
  # ).property('event_date')