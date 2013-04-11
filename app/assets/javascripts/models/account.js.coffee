App.Account = Em.Object.extend
  name: "daveCo"
  account_idBinding: 'parent.account_id'
  order_idBinding: 'parent.order_id'
  productLineIdBinding: 'parent.productLineId'
  parent: null
  isLoaded: false

App.Account.reopenClass
  find: (sctd) ->
    acct=  App.Account.create()
    acct.set('parent', sctd) 
    acct.set('isLoaded',true) 
    return acct
