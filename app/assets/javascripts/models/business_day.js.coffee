App.BusinessDay = Em.Object.extend
  appointments: []
  time_slots: []
  ts: Em.A()
  isLoaded: false
  parent: null
  tzBinding: 'parent.timezone'
  canSchedule: true 
  processApiResponse: (json) ->
    bd = @
    bd.setProperties(json)
    bd.set('ts', Em.A() )#App.SortedArray() )
    slots = Em.A()
    for k,v of bd.time_slots
      a =  App.TimeSlot.createWithMixins({key: k, data: v, parent: bd})

      slots.push a
    slots.sort (a,b) ->
      return parseInt(a.key) - parseInt(b.key) 
    bd.set('ts',slots)
    bd.set('isLoaded',true) 

    return bd

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
      #App.BusinessDay.create(response) 
      bd.processApiResponse(response)

      return bd
      )
    return bd

