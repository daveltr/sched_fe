App.IndexRoute = Em.Route.extend
  enter: ->
    console?.log("index route entered") 

  model: (params) ->
    sctd = App.SchedTourData.create(
      {account_id: 3674, order_id: 4094}
      )
    sctd.set('event_date', moment.utc().format('YYYY-MM-DD') ) 
    sctd


  setupController: (controller) ->
    sct = App.SchedTour.create( )
    bd = App.BusinessDay.create()
    ac = App.Account.create()
    
    controller.set('scheduled_tour', sct)
  
    controller.set('scheduled_tour.sched_date', '2013-04-20')
    controller.set('scheduled_tour.sched_date_time', 'No Time Selected')

    controller.set('timezone', @.get('scheduled_tour.timezone')) 

App.SchedTourRoute = Em.Route.extend
  enter: ->
    console?.log("sched tour route entered") 
  model: (params) ->
    console?.log params
    ac_id = Ember.String.htmlSafe(params.account_id)
    or_id = Ember.String.htmlSafe(params.order_id)
    sctd = App.SchedTourData.create(
      {account_id: ac_id, order_id: or_id}
      )
    sctd.set('event_date', moment.utc().format('YYYY-MM-DD') ) 
    sctd


  setupController: (controller) ->
    sctd = controller.get('content')
    sct = App.SchedTour.create()
    bd = App.BusinessDay.create()
    ac = App.Account.find(sctd)  
    
    controller.set('account', ac)
    
    controller.set('scheduled_tour', sct)
  
    controller.set('scheduled_tour.sched_date', '2013-04-20')
    controller.set('scheduled_tour.sched_date_time', 'No Time Selected')

    controller.set('timezone', @.get('scheduled_tour.timezone')) 
