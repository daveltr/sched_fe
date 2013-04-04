class App < Sinatra::Base

  set :views, settings.root + '/app/views'

  get '/' do
    erb :main
  end
  get '/test' do 
    erb :test
  end
  
end

#= require ./vendor/jquery
#= require ./vendor/handlebars
#= require ./vendor/ember
#= require ./vendor/datepicker
#= require ./vendor/moment