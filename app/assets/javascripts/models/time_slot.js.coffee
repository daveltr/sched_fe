App.TimeSlot = Em.Object.extend
  availabe_reps: {} #[]
  rep_queue: []
  tzBinding: 'parent.tz'
  time_utc: ( ->
    return moment.utc(@.get('data').id)
    ).property('data') 
  time_local: ( ->
    @.get('time_utc').local().format('h:mm a')
    ).property('data')
  time_client: ( ->
    d = @.get('time_utc')
    dc = App.DateConversionService.create( { moment_utc: d, timezone: @.get('tz') }) #,  tz_city: "America/New_York"})
    mmt = dc.converMomentUtcToTimezoneByZone()
    mmt.format('h:mm a') #format strips the incorrect GMT
    ).property('tz')
  first_rep: ( ->
    return @.get('data').available_reps["3"][0]
    # console?.log(@.get('controller.content.business_day.rep_queue'))
    ).property('data')

