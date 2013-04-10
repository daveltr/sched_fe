App.BusinessDay = Em.Object.extend
  appointments: []
  time_slots: []
  isLoaded: false
  tzBinding: 'parent.timezone'
  # tz: ( ->
  #   # window.bd = this 
  #   console?.log('tz bd changed')
  #   @.get('parent.timezone')
  #   ).observes('parent.timezone')

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


App.Account = Em.Object.extend
  name: "daveCo"

App.TimeSlot = Em.Object.extend
  availabe_reps: {} #[]
  rep_queue: []
  tzBinding: 'parent.tz'
  time_utc: ( ->
    return moment.utc(@.get('data').id)
    ).property('data') 
  time_local: ( ->
    @.get('time_utc').local().format('h:mm:ss a')
    ).property('data')
  time_client: ( ->
    d = @.get('time_utc')
    dc = App.DateConversionService.create( { moment_utc: d, timezone: @.get('tz') }) #,  tz_city: "America/New_York"})
    wt = dc.converMomentUtcToTimezoneByZone()
    wt
    ).property('tz')
  first_rep: ( ->
    return @.get('data').available_reps["3"][0]
    # console?.log(@.get('controller.content.business_day.rep_queue'))
    ).property('data')


  # business_day: ( ->
  #   v = @.get('event_date')
  #   return null unless v?
  #   bd = App.BusinessDay.find(v)  
  #   # console?.log(@.get('controller'))
  #   # bd.set('event_date', 'controller.event_date')
  #   return bd
  # ).property('event_date')