assert = chai.assert 
expect = chai.expect

describe "Sanity", ->
  it "1 should == 1", ->
    assert.equal(1,1) 

describe "App.LOG_TRANSITIONS", ->
  it "should be true", ->
    assert.equal(App.LOG_TRANSITIONS, true)

  it "expect to be true", ->
    expect(App.LOG_TRANSITIONS).to.equal(true)

describe "App.RedditLink", ->
  it "should have a title", ->
    rl = App.RedditLink.create({title:"abc"})
    expect(rl.title).to.equal('abc')