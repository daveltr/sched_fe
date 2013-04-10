App.DateConversionService = Em.Object.extend
  moment_utc: null
  timezone: null
  tz_city: null
  local_timezone: "Eastern Time (US & Canada)"
  local_city: "America/New_York" 

  lookupCityForTz: (tz) ->
    # "Eastern Time (US & Canada)",
    # "Central Time (US & Canada)",
    # "Mountain Time (US & Canada)",
    # "Pacific Time (US & Canada)",
    # "Hawaii",
    # "Alaska" 
    val = "America/New_York"
    if tz is "Eastern Time (US & Canada)"
      val = "America/New_York"
    else if tz is "Central Time (US & Canada)"
      val = "America/Chicago"
    else if tz is "Mountain Time (US & Canada)"
      val = "America/Denver"
    else if tz is "Pacific Time (US & Canada)"
      val = "America/Los_Angeles"
    else if tz is "Hawaii"
      val = "Pacific/Honolulu"
    else if tz is "Alaska" 
      val = "America/Anchorage"

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
    #TODO - this returns the incorrect offset 
    jsUtcDate = @.convertJsDateToUtc(moment_utc.toDate())
    wt = WallTime.UTCToWallTime(jsUtcDate, tz_city);
    # window.wt = wt
    # window.moment_utc = moment_utc
    mm= moment(wt.wallTime)
    mm

  convertMomentUtcToLocal: (moment_utc) ->
    convertMomentUtcToTimezone(moment_utc, @.get('local_city'))