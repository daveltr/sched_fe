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



    # controller.set('business_day', bd)
    

    #get params
    # controller.account = App.Account.create()
    # controller.business_day = App.BusinessDay.create({event_date: moment.utc()})
  # events:
  #   rdrItem: ->
  #     console?.log('rdr route')
  #     @.render('business_day', {outlet: 'busday'})


    # App.RedditLink.findAll('funny') 
    # [
    #   App.Person.create({name:"Dave"}),
    #   App.Person.create({name:"Andrew"})
    # ]


  # {{#each item in content.business_day.rep_queue}}
  #   <ul>
  #     <li>{{item}}</li>
  #   </ul>
  # {{/each}}