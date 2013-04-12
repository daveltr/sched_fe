App.PrimaryContact = Em.Object.extend
  contactId: 0
  firstName: null
  lastName: null
  email_address: null
  name: ( ->
    return "#{firstName} #{lastName}"
    ).property('firstName','lastName')

App.Order = Em.Object.extend
  orderId: 0
  productLineId: 0
  tours_scheduled: 1
  owner: null
  start_date: null
  end_date: null
  primaryContact: App.PrimaryContact.create()

App.Account = Em.Object.extend
  name: "daveCo"
  account_idBinding: 'parent.account_id'
  order_idBinding: 'parent.order_id'
  productLineIdBinding: 'parent.productLineId'
  parent: null
  order: App.Order.create()
  orders: []
  isLoaded: false
  validOrder: ( ->
    # console?.log(@.get('order.orderId'))
    # console?.log @.get('order_id').toString()
    @.get('order.orderId').toString() == @.get('order_id').toString()
    ).property('order.orderId')
  previouslyScheduled: (->
    if @.get('order.tours_scheduled') > 0 
      return true
    else 
      return false
    ).property('order.tours_scheduled')

App.Account.reopenClass
  find: (sctd) ->
    acct=  App.Account.create()
    acct.set('parent', sctd) 
    acct.set('isLoaded',true) 
    acct.set('order.orderId', 4094)
    return acct