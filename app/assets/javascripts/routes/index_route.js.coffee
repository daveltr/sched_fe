App.IndexRoute = Em.Route.extend
  enter: ->
    console?.log("index route entered") 

  # model: (params) ->
  #   sctd = App.SchedTourData.create(
  #     {account_id: 3674, order_id: 4094}
  #     )
  #   sctd.set('event_date', moment.utc().format('YYYY-MM-DD') ) 
  #   sctd


  # setupController: (controller) ->
    # controller.transitionToRoute("sched_tour", {account_id: 12345 }) #, order_id:4567} )
    # sct = App.SchedTour.create( )
    # bd = App.BusinessDay.create()
    # ac = App.Account.create()
    
    # controller.set('scheduled_tour', sct)
  
    # controller.set('scheduled_tour.sched_date', '2013-04-20')
    # controller.set('scheduled_tour.sched_date_time', 'No Time Selected')

    # controller.set('timezone', @.get('scheduled_tour.timezone')) 


# <div class = "row-fluid">
#   <div class="span3">
#     <h5>Tour Options</h5>
#     {{view Em.Select contentBinding='App.tz_options' valueBinding='timezone'}}
#     {{view App.DatePickerField  valueBinding='event_date'}}
#     <hr/>
#     <div>
#       {{!controller}}
#       <h5>Scheduled Tour Info</h5>
#       <p>{{scheduled_tour.timezone}}</p>
#       <p>ST Date: {{scheduled_tour.sched_date}}</p>
#       <p>ST Time: {{scheduled_tour.sched_date_time}}</p>
#     </div>
#     {{outlet}}
#   </div>
#   <div class="span3">
#     {{view App.AccountView contentBinding="account"}}
#   </div>
#   <div class="span4">
#     <div>
#       {{view App.BusinessDayView }}
#       {{!render 'business_day' business_day event_dateBinding='event_date' }}
#     </div>
#   </div>
# </div>
