App.IndexRoute = Em.Route.extend
  enter: ->
    console?.log("index route entered") 
  model: ->
    #get params
    sct = App.SchedTour.create()
    sct.set('account', App.Account.create() )
    sct

  # setupController: (controller) ->

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


