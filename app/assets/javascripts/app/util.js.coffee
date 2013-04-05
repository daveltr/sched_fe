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

