App.DatePickerField = Em.View.extend
  # valueBinding: ['view.onDate']
  # classBindings: ['disabled']
  date_string: (->
    return @.get('value').toString();
    ).property('value')
  templateName: 'datepicker'
  didInsertElement: ->
    self = this

    onChangeDate = (ev) ->
      self.set "value", ev.date
    @$('.datepicker').datepicker({separator:"-"}).on "changeDate", onChangeDate

App.TextField = Em.TextField.extend 
  didInsertElement: ->
    this.$().focus();
    @_super()
  
# <hr/><button {{action rdrItem}}>Search</button>