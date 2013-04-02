App.DatePickerField = Em.TextField.extend
  valueBinding: ['view.onDate']
  didInsertElement: ->
    self = this
    onChangeDate = (ev) ->
      self.set "value", ev.date
      self.get('controller').rdrItem()
    @$().datepicker().on "changeDate", onChangeDate

App.TextField = Em.TextField.extend 
  didInsertElement: ->
    this.$().focus();
    @_super()
  