App.BusinessDay = Em.Object.extend
  appointments: []
  time_slots: []


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
        bd.set('ts', Em.A() )
        console?.log(bd.time_slots)
        # bd.time_slots.forEach (sl) ->
        for k,v of bd.time_slots 
          bd.ts.push App.TimeSlot.create({key: k, data: v})
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