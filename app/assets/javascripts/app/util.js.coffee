###
Return an Object sorted by it's Key
###
App.sortObjectByKey = (obj) ->
  keys = []
  sorted_obj = {}
  for key of obj
    keys.push key  if obj.hasOwnProperty(key)
  
  # sort keys
  keys.sort()
  
  # create new array based on Sorted Keys
  jQuery.each keys, (i, key) ->
    sorted_obj[key] = obj[key]

  sorted_obj


App.splitParams = (params_string) ->
  return [params_string, {}] if params_string.indexOf("?") is -1
  first_portion = params_string.split("?")[0]
  query_portion = params_string.split("?")[1]
  params = {}
  pairs = query_portion.split(";")
  pairs.forEach (pair) -> 
    kv = pair.split("=")
    params[kv[0]]= kv[1]
  return [first_portion, params]
