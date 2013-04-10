App.BusinessDay = Em.Object.extend
  appointments: []
  time_slots: []
  isLoaded: false
  parent: null
  tzBinding: 'parent.timezone'

App.BusinessDay.reopenClass
  find: (event_date) ->
    # base_url = "http://192.168.11.61:3000/view_schedule"
    base_url = "http://localhost:9393/view_schedule"
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
          slots.push App.TimeSlot.create({key: k, data: v, parent: bd})
        slots.sort (a,b) ->
          # console?.log("#{a.key} vs #{b.key}")
          return parseInt(a.key) - parseInt(b.key) 
          # return a.key>b.key? 1 : (a.key<b.key ? -1 : 0); 
        window.slot= slots[0]
        bd.set('ts',slots)
        bd.set('isLoaded',true) 

        return bd
      )
    return bd


