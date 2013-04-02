class App < Sinatra::Base

  set :views, settings.root + '/app/views'

  get '/' do
    erb :main
  end
  get '/test' do 
    erb :test
  end
  
end

