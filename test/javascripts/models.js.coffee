assert = chai.assert 
expect = chai.expect

describe "App.LOG_TRANSITIONS", ->
  it "expects LOG_TRANSITIONS to be true", ->
    expect(App.LOG_TRANSITIONS).to.equal(true)

describe "App.BusinessDay", ->
  beforeEach ->
    sinon.spy($, 'ajax') 
    
  afterEach ->
    $.ajax.restore()

  it "#processApiResponse creates ts from time_slots", ->
    bd = App.BusinessDay.create({})
    expect(1).to.equal(1)
    json = {"rep_queue":["MenuTest","mbainbridge","pgaul","jackied","bfranco","mhallman","jgoldhah","cdelaney","mcatini","PCAGGIAN","mekenazi","bsimon","npacitti","mkaisner","anichols"],"options":{},"appointments":[{"id":"24613","product_line":"6","username":"cdelaney","start_time":"2013-04-01T18:00:00+00:00","end_time":"2013-04-01T18:30:00+00:00"},{"id":"24617","product_line":"6","username":"cdelaney","start_time":"2013-04-01T18:00:00+00:00","end_time":"2013-04-01T18:30:00+00:00"},{"id":"24622","product_line":"6","username":"cdelaney","start_time":"2013-04-01T18:00:00+00:00","end_time":"2013-04-01T18:30:00+00:00"},{"id":"24626","product_line":"6","username":"cdelaney","start_time":"2013-04-01T18:00:00+00:00","end_time":"2013-04-01T18:30:00+00:00"},{"id":"24629","product_line":"6","username":"dtripler","start_time":"2013-04-01T14:00:00+00:00","end_time":"2013-04-01T14:30:00+00:00"},{"id":"24611","product_line":"6","username":"API","start_time":"2013-04-01T12:25:00+00:00","end_time":"2013-04-01T12:30:00+00:00"}],"reps":{"6":["mkaisner","npacitti","mekenazi","bsimon","anichols","cdelaney"],"3":["pgaul"],"4":["MenuTest","jackied","bfranco","mhallman","jgoldhah","PCAGGIAN","mcatini"]},"datetime":"2013-04-01T00:00:00+00:00","date":"2013-04-01","time_slots":{"0900":{"id":"2013-04-01T13:00:00+00:00","start_time":"2013-04-01T13:00:00+00:00","end_time":"2013-04-01T13:30:00+00:00","available_reps":{"6":["mkaisner","npacitti","mekenazi","bsimon","anichols","cdelaney"],"3":["pgaul"],"4":["MenuTest","jackied","bfranco","mhallman","jgoldhah","PCAGGIAN","mcatini"]},"appointments":[]},"0930":{"id":"2013-04-01T13:30:00+00:00","start_time":"2013-04-01T13:30:00+00:00","end_time":"2013-04-01T14:00:00+00:00","available_reps":{"6":["mkaisner","npacitti","mekenazi","bsimon","anichols","cdelaney"],"3":["pgaul"],"4":["MenuTest","jackied","bfranco","mhallman","jgoldhah","PCAGGIAN","mcatini"]},"appointments":[]},"1000":{"id":"2013-04-01T14:00:00+00:00","start_time":"2013-04-01T14:00:00+00:00","end_time":"2013-04-01T14:30:00+00:00","available_reps":{"6":["mkaisner","npacitti","mekenazi","bsimon","anichols","cdelaney"],"3":["pgaul"],"4":["MenuTest","jackied","bfranco","mhallman","jgoldhah","PCAGGIAN","mcatini"]},"appointments":[{"id":"24629","product_line":"6","username":"dtripler","start_time":"2013-04-01T14:00:00+00:00","end_time":"2013-04-01T14:30:00+00:00"}]},"1030":{"id":"2013-04-01T14:30:00+00:00","start_time":"2013-04-01T14:30:00+00:00","end_time":"2013-04-01T15:00:00+00:00","available_reps":{"6":["mkaisner","npacitti","mekenazi","bsimon","anichols","cdelaney"],"3":["pgaul"],"4":["MenuTest","jackied","bfranco","mhallman","jgoldhah","PCAGGIAN","mcatini"]},"appointments":[]},"1100":{"id":"2013-04-01T15:00:00+00:00","start_time":"2013-04-01T15:00:00+00:00","end_time":"2013-04-01T15:30:00+00:00","available_reps":{"6":["mkaisner","npacitti","mekenazi","bsimon","anichols","cdelaney"],"3":["pgaul"],"4":["MenuTest","jackied","bfranco","mhallman","jgoldhah","PCAGGIAN","mcatini"]},"appointments":[]},"1130":{"id":"2013-04-01T15:30:00+00:00","start_time":"2013-04-01T15:30:00+00:00","end_time":"2013-04-01T16:00:00+00:00","available_reps":{"6":["mkaisner","npacitti","mekenazi","bsimon","anichols","cdelaney"],"3":["pgaul"],"4":["MenuTest","jackied","bfranco","mhallman","jgoldhah","PCAGGIAN","mcatini"]},"appointments":[]},"1200":{"id":"2013-04-01T16:00:00+00:00","start_time":"2013-04-01T16:00:00+00:00","end_time":"2013-04-01T16:30:00+00:00","available_reps":{"6":["mkaisner","npacitti","mekenazi","bsimon","anichols","cdelaney"],"3":["pgaul"],"4":["MenuTest","jackied","bfranco","mhallman","jgoldhah","PCAGGIAN","mcatini"]},"appointments":[]},"1230":{"id":"2013-04-01T16:30:00+00:00","start_time":"2013-04-01T16:30:00+00:00","end_time":"2013-04-01T17:00:00+00:00","available_reps":{"6":["mkaisner","npacitti","mekenazi","bsimon","anichols","cdelaney"],"3":["pgaul"],"4":["MenuTest","jackied","bfranco","mhallman","jgoldhah","PCAGGIAN","mcatini"]},"appointments":[]},"1300":{"id":"2013-04-01T17:00:00+00:00","start_time":"2013-04-01T17:00:00+00:00","end_time":"2013-04-01T17:30:00+00:00","available_reps":{"6":["mkaisner","npacitti","mekenazi","bsimon","anichols","cdelaney"],"3":["pgaul"],"4":["MenuTest","jackied","bfranco","mhallman","jgoldhah","PCAGGIAN","mcatini"]},"appointments":[]},"1330":{"id":"2013-04-01T17:30:00+00:00","start_time":"2013-04-01T17:30:00+00:00","end_time":"2013-04-01T18:00:00+00:00","available_reps":{"6":["mkaisner","npacitti","mekenazi","bsimon","anichols","cdelaney"],"3":["pgaul"],"4":["MenuTest","jackied","bfranco","mhallman","jgoldhah","PCAGGIAN","mcatini"]},"appointments":[]},"1400":{"id":"2013-04-01T18:00:00+00:00","start_time":"2013-04-01T18:00:00+00:00","end_time":"2013-04-01T18:30:00+00:00","available_reps":{"6":["mkaisner","npacitti","mekenazi","bsimon","anichols"],"3":["pgaul"],"4":["MenuTest","jackied","bfranco","mhallman","jgoldhah","PCAGGIAN","mcatini"]},"appointments":[{"id":"24613","product_line":"6","username":"cdelaney","start_time":"2013-04-01T18:00:00+00:00","end_time":"2013-04-01T18:30:00+00:00"},{"id":"24617","product_line":"6","username":"cdelaney","start_time":"2013-04-01T18:00:00+00:00","end_time":"2013-04-01T18:30:00+00:00"},{"id":"24622","product_line":"6","username":"cdelaney","start_time":"2013-04-01T18:00:00+00:00","end_time":"2013-04-01T18:30:00+00:00"},{"id":"24626","product_line":"6","username":"cdelaney","start_time":"2013-04-01T18:00:00+00:00","end_time":"2013-04-01T18:30:00+00:00"}]},"1430":{"id":"2013-04-01T18:30:00+00:00","start_time":"2013-04-01T18:30:00+00:00","end_time":"2013-04-01T19:00:00+00:00","available_reps":{"6":["mkaisner","npacitti","mekenazi","bsimon","anichols","cdelaney"],"3":["pgaul"],"4":["MenuTest","jackied","bfranco","mhallman","jgoldhah","PCAGGIAN","mcatini"]},"appointments":[]},"1500":{"id":"2013-04-01T19:00:00+00:00","start_time":"2013-04-01T19:00:00+00:00","end_time":"2013-04-01T19:30:00+00:00","available_reps":{"6":["mkaisner","npacitti","mekenazi","bsimon","anichols","cdelaney"],"3":["pgaul"],"4":["MenuTest","jackied","bfranco","mhallman","jgoldhah","PCAGGIAN","mcatini"]},"appointments":[]},"1530":{"id":"2013-04-01T19:30:00+00:00","start_time":"2013-04-01T19:30:00+00:00","end_time":"2013-04-01T20:00:00+00:00","available_reps":{"6":["mkaisner","npacitti","mekenazi","bsimon","anichols","cdelaney"],"3":["pgaul"],"4":["MenuTest","jackied","bfranco","mhallman","jgoldhah","PCAGGIAN","mcatini"]},"appointments":[]},"1600":{"id":"2013-04-01T20:00:00+00:00","start_time":"2013-04-01T20:00:00+00:00","end_time":"2013-04-01T20:30:00+00:00","available_reps":{"6":["mkaisner","npacitti","mekenazi","bsimon","anichols","cdelaney"],"3":["pgaul"],"4":["MenuTest","jackied","bfranco","mhallman","jgoldhah","PCAGGIAN","mcatini"]},"appointments":[]},"1630":{"id":"2013-04-01T20:30:00+00:00","start_time":"2013-04-01T20:30:00+00:00","end_time":"2013-04-01T21:00:00+00:00","available_reps":{"6":["mkaisner","npacitti","mekenazi","bsimon","anichols","cdelaney"],"3":["pgaul"],"4":["MenuTest","jackied","bfranco","mhallman","jgoldhah","PCAGGIAN","mcatini"]},"appointments":[]},"1700":{"id":"2013-04-01T21:00:00+00:00","start_time":"2013-04-01T21:00:00+00:00","end_time":"2013-04-01T21:30:00+00:00","available_reps":{"6":["mkaisner","npacitti","mekenazi","bsimon","anichols","cdelaney"],"3":["pgaul"],"4":["MenuTest","jackied","bfranco","mhallman","jgoldhah","PCAGGIAN","mcatini"]},"appointments":[]}},"rep_queue_detail":{"MenuTest":1,"mbainbridge":1,"pgaul":1,"jackied":1,"bfranco":1,"mhallman":1,"jgoldhah":1,"PCAGGIAN":1,"mcatini":1,"cdelaney":1,"mekenazi":4,"bsimon":5,"mkaisner":5,"npacitti":5,"anichols":7}}
    test_case = bd.processApiResponse(json) 
    console?.log(test_case.ts[0])
    # by definition, 9am to 5:30 pm should be 17 timeslots from the server
    expect(test_case.ts.length).to.equal(17) 

  it "class#find makes an ajax request", ->
    bd = App.BusinessDay.find('2013-04-03')
    expect($.ajax.calledOnce).to.be.true
