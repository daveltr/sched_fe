App.IndexRoute = Em.Route.extend
  enter: ->
    console?.log("index route entered") 
  model: ->
    #get params
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
