class App < Sinatra::Base

  set :views, settings.root + '/app/views'

  error do
    content_type :json
    status 422 # or whatever

    e = env['sinatra.error']
    {:result => 'error', :message => e.message}.to_json
  end

  get '/' do
    erb :main
  end
  get '/test' do 
    erb :test
  end

  get '/view_schedule/:prm' do
    dt_str = params[:prm].gsub('.json','')
    content_type :json    
    st=<<EOF
      {"rep_queue":["MenuTest","mbainbridge","pgaul",
      "jackied","bfranco","mhallman","jgoldhah","cdelaney","mcatini",
      "PCAGGIAN","mekenazi","bsimon","npacitti","mkaisner","anichols"],
      "options":{},
      "appointments":[{"id":"24613","product_line":"6",
        "username":"cdelaney","start_time":"#{dt_str}T18:00:00+00:00","end_time":"#{dt_str}T18:30:00+00:00"},{"id":"24617","product_line":"6","username":"cdelaney","start_time":"#{dt_str}T18:00:00+00:00","end_time":"#{dt_str}T18:30:00+00:00"},{"id":"24622","product_line":"6","username":"cdelaney","start_time":"#{dt_str}T18:00:00+00:00","end_time":"#{dt_str}T18:30:00+00:00"},{"id":"24626","product_line":"6","username":"cdelaney","start_time":"#{dt_str}T18:00:00+00:00","end_time":"#{dt_str}T18:30:00+00:00"},{"id":"24629","product_line":"6","username":"dtripler","start_time":"#{dt_str}T14:00:00+00:00","end_time":"#{dt_str}T14:30:00+00:00"},{"id":"24611","product_line":"6","username":"API","start_time":"#{dt_str}T12:25:00+00:00","end_time":"#{dt_str}T12:30:00+00:00"}],"reps":{"6":["mkaisner","npacitti","mekenazi","bsimon","anichols","cdelaney"],"3":["pgaul"],"4":["MenuTest","jackied","bfranco","mhallman","jgoldhah","PCAGGIAN","mcatini"]},"datetime":"#{dt_str}T00:00:00+00:00","date":"#{dt_str}",
        "time_slots":{"0900":{"id":"#{dt_str}T13:00:00+00:00","start_time":"#{dt_str}T13:00:00+00:00","end_time":"#{dt_str}T13:30:00+00:00","available_reps":{"6":["mkaisner","npacitti","mekenazi","bsimon","anichols","cdelaney"],"3":["pgaul"],"4":["MenuTest","jackied","bfranco","mhallman","jgoldhah","PCAGGIAN","mcatini"]},"appointments":[]},"0930":{"id":"#{dt_str}T13:30:00+00:00","start_time":"#{dt_str}T13:30:00+00:00","end_time":"#{dt_str}T14:00:00+00:00","available_reps":{"6":["mkaisner","npacitti","mekenazi","bsimon","anichols","cdelaney"],"3":["pgaul"],"4":["MenuTest","jackied","bfranco","mhallman","jgoldhah","PCAGGIAN","mcatini"]},"appointments":[]},"1000":{"id":"#{dt_str}T14:00:00+00:00","start_time":"#{dt_str}T14:00:00+00:00","end_time":"#{dt_str}T14:30:00+00:00","available_reps":{"6":["mkaisner","npacitti","mekenazi","bsimon","anichols","cdelaney"],"3":["pgaul"],"4":["MenuTest","jackied","bfranco","mhallman","jgoldhah","PCAGGIAN","mcatini"]},"appointments":[{"id":"24629","product_line":"6","username":"dtripler","start_time":"#{dt_str}T14:00:00+00:00","end_time":"#{dt_str}T14:30:00+00:00"}]},"1030":{"id":"#{dt_str}T14:30:00+00:00","start_time":"#{dt_str}T14:30:00+00:00","end_time":"#{dt_str}T15:00:00+00:00","available_reps":{"6":["mkaisner","npacitti","mekenazi","bsimon","anichols","cdelaney"],"3":["pgaul"],"4":["MenuTest","jackied","bfranco","mhallman","jgoldhah","PCAGGIAN","mcatini"]},"appointments":[]},"1100":{"id":"#{dt_str}T15:00:00+00:00","start_time":"#{dt_str}T15:00:00+00:00","end_time":"#{dt_str}T15:30:00+00:00","available_reps":{"6":["mkaisner","npacitti","mekenazi","bsimon","anichols","cdelaney"],"3":["pgaul"],"4":["MenuTest","jackied","bfranco","mhallman","jgoldhah","PCAGGIAN","mcatini"]},"appointments":[]},"1130":{"id":"#{dt_str}T15:30:00+00:00","start_time":"#{dt_str}T15:30:00+00:00","end_time":"#{dt_str}T16:00:00+00:00","available_reps":{"6":["mkaisner","npacitti","mekenazi","bsimon","anichols","cdelaney"],"3":["pgaul"],"4":["MenuTest","jackied","bfranco","mhallman","jgoldhah","PCAGGIAN","mcatini"]},"appointments":[]},"1200":{"id":"#{dt_str}T16:00:00+00:00","start_time":"#{dt_str}T16:00:00+00:00","end_time":"#{dt_str}T16:30:00+00:00","available_reps":{"6":["mkaisner","npacitti","mekenazi","bsimon","anichols","cdelaney"],"3":["pgaul"],"4":["MenuTest","jackied","bfranco","mhallman","jgoldhah","PCAGGIAN","mcatini"]},"appointments":[]},"1230":{"id":"#{dt_str}T16:30:00+00:00","start_time":"#{dt_str}T16:30:00+00:00","end_time":"#{dt_str}T17:00:00+00:00","available_reps":{"6":["mkaisner","npacitti","mekenazi","bsimon","anichols","cdelaney"],"3":["pgaul"],"4":["MenuTest","jackied","bfranco","mhallman","jgoldhah","PCAGGIAN","mcatini"]},"appointments":[]},"1300":{"id":"#{dt_str}T17:00:00+00:00","start_time":"#{dt_str}T17:00:00+00:00","end_time":"#{dt_str}T17:30:00+00:00","available_reps":{"6":["mkaisner","npacitti","mekenazi","bsimon","anichols","cdelaney"],"3":["pgaul"],"4":["MenuTest","jackied","bfranco","mhallman","jgoldhah","PCAGGIAN","mcatini"]},"appointments":[]},"1330":{"id":"#{dt_str}T17:30:00+00:00","start_time":"#{dt_str}T17:30:00+00:00","end_time":"#{dt_str}T18:00:00+00:00","available_reps":{"6":["mkaisner","npacitti","mekenazi","bsimon","anichols","cdelaney"],"3":["pgaul"],"4":["MenuTest","jackied","bfranco","mhallman","jgoldhah","PCAGGIAN","mcatini"]},"appointments":[]},"1400":{"id":"#{dt_str}T18:00:00+00:00","start_time":"#{dt_str}T18:00:00+00:00","end_time":"#{dt_str}T18:30:00+00:00","available_reps":{"6":["mkaisner","npacitti","mekenazi","bsimon","anichols"],"3":["pgaul"],"4":["MenuTest","jackied","bfranco","mhallman","jgoldhah","PCAGGIAN","mcatini"]},"appointments":[{"id":"24613","product_line":"6","username":"cdelaney","start_time":"#{dt_str}T18:00:00+00:00","end_time":"#{dt_str}T18:30:00+00:00"},{"id":"24617","product_line":"6","username":"cdelaney","start_time":"#{dt_str}T18:00:00+00:00","end_time":"#{dt_str}T18:30:00+00:00"},{"id":"24622","product_line":"6","username":"cdelaney","start_time":"#{dt_str}T18:00:00+00:00","end_time":"#{dt_str}T18:30:00+00:00"},{"id":"24626","product_line":"6","username":"cdelaney","start_time":"#{dt_str}T18:00:00+00:00","end_time":"#{dt_str}T18:30:00+00:00"}]},"1430":{"id":"#{dt_str}T18:30:00+00:00","start_time":"#{dt_str}T18:30:00+00:00","end_time":"#{dt_str}T19:00:00+00:00","available_reps":{"6":["mkaisner","npacitti","mekenazi","bsimon","anichols","cdelaney"],"3":["pgaul"],"4":["MenuTest","jackied","bfranco","mhallman","jgoldhah","PCAGGIAN","mcatini"]},"appointments":[]},"1500":{"id":"#{dt_str}T19:00:00+00:00","start_time":"#{dt_str}T19:00:00+00:00","end_time":"#{dt_str}T19:30:00+00:00","available_reps":{"6":["mkaisner","npacitti","mekenazi","bsimon","anichols","cdelaney"],"3":["pgaul"],"4":["MenuTest","jackied","bfranco","mhallman","jgoldhah","PCAGGIAN","mcatini"]},"appointments":[]},"1530":{"id":"#{dt_str}T19:30:00+00:00","start_time":"#{dt_str}T19:30:00+00:00","end_time":"#{dt_str}T20:00:00+00:00","available_reps":{"6":["mkaisner","npacitti","mekenazi","bsimon","anichols","cdelaney"],"3":["pgaul"],"4":["MenuTest","jackied","bfranco","mhallman","jgoldhah","PCAGGIAN","mcatini"]},"appointments":[]},"1600":{"id":"#{dt_str}T20:00:00+00:00","start_time":"#{dt_str}T20:00:00+00:00","end_time":"#{dt_str}T20:30:00+00:00","available_reps":{"6":["mkaisner","npacitti","mekenazi","bsimon","anichols","cdelaney"],"3":["pgaul"],"4":["MenuTest","jackied","bfranco","mhallman","jgoldhah","PCAGGIAN","mcatini"]},"appointments":[]},"1630":{"id":"#{dt_str}T20:30:00+00:00","start_time":"#{dt_str}T20:30:00+00:00","end_time":"#{dt_str}T21:00:00+00:00","available_reps":{"6":["mkaisner","npacitti","mekenazi","bsimon","anichols","cdelaney"],"3":["pgaul"],"4":["MenuTest","jackied","bfranco","mhallman","jgoldhah","PCAGGIAN","mcatini"]},"appointments":[]},"1700":{"id":"#{dt_str}T21:00:00+00:00","start_time":"#{dt_str}T21:00:00+00:00","end_time":"#{dt_str}T21:30:00+00:00","available_reps":{"6":["mkaisner","npacitti","mekenazi","bsimon","anichols","cdelaney"],"3":["pgaul"],"4":["MenuTest","jackied","bfranco","mhallman","jgoldhah","PCAGGIAN","mcatini"]},"appointments":[]}},"rep_queue_detail":{"MenuTest":1,"mbainbridge":1,"pgaul":1,"jackied":1,"bfranco":1,"mhallman":1,"jgoldhah":1,"PCAGGIAN":1,"mcatini":1,"cdelaney":1,"mekenazi":4,"bsimon":5,"mkaisner":5,"npacitti":5,"anichols":7}} 
EOF
    JSON.parse(st).to_json
  end

  get '/api/accounts/:account/orders/:order' do
    content_type :json    
    ac_id= params[:account]
    or_id=params[:order].gsub('.json','')
    tours_sched_ct=1
    if ac_id == "1234"
      status 422
      val = {"error"=> "Invalid Accout/Order (API Lookup Failed)"}.to_json
      # raise "Invalid Account"
    else
      st = <<EOF
      {"id":"3674","company":"Test - Dave T RLI ext","first_order_id":"4094","first_product_line":"6","orders":[{"id":"4094","product_line":"6","owner":"Colin Delaney","start_date":"04-01-2013","end_date":"06-30-2013","tours_scheduled":#{tours_sched_ct},"primary_contact":{"id":"5594","first_name":"dtripler1600","last_name":"Tripler","email_address":"dtripler1600@b21pubs.com"}}]}
EOF
      val = JSON.parse(st).to_json
    end
    val
  end

end

#= require ./vendor/jquery
#= require ./vendor/handlebars
#= require ./vendor/ember
#= require ./vendor/datepicker
#= require ./vendor/moment