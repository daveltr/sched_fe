App.IndexRoute = Em.Route.extend
  enter: ->
    console?.log("index route entered") 
  model: ->
    #get params
    App.SchedTour.create()
  # events:
  #   rdrItem: ->
  #     console?.log('rdr route')
  #     @.render('business_day', {outlet: 'busday'})


    # App.RedditLink.findAll('funny') 
    # [
    #   App.Person.create({name:"Dave"}),
    #   App.Person.create({name:"Andrew"})
    # ]


