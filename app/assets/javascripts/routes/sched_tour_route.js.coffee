App.SchedTourRoute = Em.Route.extend
  enter: ->
    console?.log("sched tour route entered") 
  serialize: (model, params) ->
    {
      account_id: model.account_id
      order_id: model.order_id
    }
    
  model: (params) ->
    # console?.log(params)
    [split_order_id, or_params] = App.splitParams(params.order_id) #unless params.order_id.indexOf('?') is -1
    ac_id = Ember.String.htmlSafe(params.account_id)
    or_id = Ember.String.htmlSafe(split_order_id) 
    
    if App.productLines.indexOf(ac_id.toString()) !=-1
      # console?.log("Dupe")
      sctd = App.SchedTourData.create
        account_id: 0, 
        order_id: 0, 
        productLineId:ac_id.toString(),
        isDuplicate: true,
        telescriptId: or_id, 
        contact: or_params.email 
    else
      sctd = App.SchedTourData.create( {account_id: ac_id, order_id: or_id} )
    sctd


  setupController: (controller) ->
    sctd = controller.get('content')
    sct = App.SchedTour.create()
    bd = App.BusinessDay.create()
    if sctd.get('account_id').toString() is "0"
      ac = App.Account.create()
      ac.set('isDuplicate', true) 
    else
      ac = App.Account.find(sctd)  

    controller.set('account', ac)    
    controller.set('scheduled_tour', sct)
    
    if sctd.get('date_override') 
      console?.log("override: #{sctd.get('date_override')}")
      controller.set('scheduled_tour.sched_date', sctd.get('date_override'))
    else
      controller.set('scheduled_tour.sched_date', '2013-05-20')

    controller.set('scheduled_tour.sched_date_time', 'No Time Selected')
    controller.set('timezone', @.get('scheduled_tour.timezone')) 