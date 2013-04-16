App.NextAvailableRepService = Em.Object.extend
  parent: null #App.SchedTourData

  nextRepByProductLineId: (prl=@.get('parent.productLineId'), rep_queue=@.get('parent.business_day.rep_queue'), avail_reps=@.get('parent.available_reps') ) ->
    # console?.log prl
    # console?.log rep_queue.toArray()
    # console?.log avail_reps[prl].toArray()
    rep_list = avail_reps[prl]
    for i in rep_queue
      return i if rep_list.indexOf(i) != -1

    return null