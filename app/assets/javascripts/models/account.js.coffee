App.Account = Em.Object.extend
  base_url: "http://localhost:9393/api/accounts"
  name: null
  account_idBinding: 'parent.account_id'
  order_idBinding: 'parent.order_id'
  productLineIdBinding: 'parent.productLineId'
  parent: null
  order: null #App.Order.create()
  isLoaded: false
  isError: false
  validOrder: ( ->
    # console?.log(@.get('order.orderId'))
    # console?.log @.get('order_id').toString()
    v = false
    if @.get('order')
      v =@.get('order.id').toString() == @.get('order_id').toString()
    v
    ).property('order.id')
  previouslyScheduled: (->
    if @.get('order.tours_scheduled') > 0 
      return true
    else 
      return false
    ).property('order.tours_scheduled')

App.Account.reopen
  getBaseUrl: () ->
    url = "#{@.get('base_url')}/#{@.get('parent.account_id')}/orders/#{@.get('parent.order_id') }"
    url

  loadFromApi: (url = @.getBaseUrl()) ->
    self = @
    $.ajax(
      url: url
      type: "GET" 
      ).then( (response) ->
        self.parseApiResponse(response)
      ).fail( (response) ->
        self.failApiResponse(self, response) 
      )

  failApiResponse: (acct, response) ->
    # console?.log("failure") 
    console?.log(response.statusText) 
    @.set("error", response.statusText) 
    @.set('isError', true)
    @.set('isLoaded', false) 
    @

  parseApiResponse: (response) ->
    # console?.log(response) 
    @.set('isLoaded',true) 
    @.setProperties(response) 
    @.set('name', response.company)
    @.set('order', App.Order.create(response.orders[0]))
    # console?.log(@.get('order'))
    @

    # @.set('order', App.Order.parse(response.orders[0]))

App.Account.reopenClass
  find: (sctd) ->
    # console?.log url  
    acct=  App.Account.create() 
    acct.set('parent', sctd) 
    acct.loadFromApi()
    return acct