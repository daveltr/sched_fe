App.IndexRoute = Em.Route.extend
  enter: ->
    console?.log("index route entered") 
  model: ->
    #get params
    App.SchedTourData.create(
      {account_id: 3674, order_id: 4094, 
      event_date: moment.utc().format('YYYY-MM-DD')}
      )

  setupController: (controller) ->
    sct = App.SchedTour.create()
    bd = App.BusinessDay.create()
  
    window.test = sct
    controller.set('account', App.Account.create() )
    controller.set('scheduled_tour', sct)
    sct.set("schedDateBinding", Em.Binding.from('controller.content.event_date'))
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