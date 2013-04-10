App.DateConversionService = Em.Object.extend
  moment_utc: null
  timezone: null
  tz_city: null
  local_timezone: "Eastern Time (US & Canada)"
  local_city: "America/New_York" 

  lookupCityForTz: (tz) ->
    val = "America/New_York"
    if tz is "Eastern Time (US & Canada)"
      val = "America/New_York"
    if tz is "Mountain Time" 
      val = "America/Phoenix"
    @.set('tz_city', val)
    return val

  convertJsDateToUtc: (date) ->
    new Date(date.getUTCFullYear(), date.getUTCMonth(), date.getUTCDate(), date.getUTCHours(), date.getUTCMinutes(), date.getUTCSeconds())

  converMomentUtcToTimezoneByZone: ( moment_utc = null, timezone = null ) ->
    moment_utc = @.get('moment_utc') if moment_utc is null 
    timezone = @.get('timezone') if timezone is null
    city = @.lookupCityForTz(timezone) 
    @.convertMomentUtcToTimezone(moment_utc, city )

  convertMomentUtcToTimezone: (moment_utc=@.get('moment_utc'), tz_city = @.get('tz_city')) ->
    jsUtcDate = @.convertJsDateToUtc(moment_utc.toDate())
    wt = WallTime.UTCToWallTime(jsUtcDate, tz_city);
    moment(wt.wallTime)

  convertMomentUtcToLocal: (moment_utc) ->
    convertMomentUtcToTimezone(moment_utc, @.get('local_city'))