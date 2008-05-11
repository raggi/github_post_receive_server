require File.dirname(__FILE__) + '/../spec_helper'

describe "Rack Post-Receive Server :-P" do 
  before do
    @server = GithubPostReceiveServer::RackApp.new
  end
  
  it "should reply with a rude message on GET" do 
    req = Rack::MockRequest.new(@server)
    res = req.get("/")
    res.should.be.ok
    res.should.match /be.*gone.*foul/i # *evil grin*
  end
  it "should reply with a rude message on GET" do 
    req = Rack::MockRequest.new(@server)
    res = req.post("/", {})
    res.should.be.ok
    res.should.match /be.*gone.*foul/i # *evil grin*
  end
  
  GITHUB_JSON = <<-GITHUB_JSON
  { 
    "before": "5aef35982fb2d34e9d9d4502f6ede1072793222d",
    "repository": {
      "url": "http://github.com/defunkt/github",
      "name": "github",
      "owner": {
        "email": "chris@ozmm.org",
        "name": "defunkt" 
      }
    },
    "commits": {
      "41a212ee83ca127e3c8cf465891ab7216a705f59": {
        "url": "http://github.com/defunkt/github/commit/41a212ee83ca127e3c8cf465891ab7216a705f59",
        "author": {
          "email": "chris@ozmm.org",
          "name": "Chris Wanstrath" 
        },
        "message": "okay i give in",
        "timestamp": "2008-02-15T14:57:17-08:00" 
      },
      "de8251ff97ee194a289832576287d6f8ad74e3d0": {
        "url": "http://github.com/defunkt/github/commit/de8251ff97ee194a289832576287d6f8ad74e3d0",
        "author": {
          "email": "chris@ozmm.org",
          "name": "Chris Wanstrath" 
        },
        "message": "update pricing a tad",
        "timestamp": "2008-02-15T14:36:34-08:00" 
      }
    },
    "after": "de8251ff97ee194a289832576287d6f8ad74e3d0",
    "ref": "refs/heads/master" 
  }
  GITHUB_JSON
  
  it "should reply with a nice message on POST with a payload" do 
    req = Rack::MockRequest.new(@server)
    res = req.post("/", :input => "payload=#{GITHUB_JSON}")
    res.should.be.ok
    res.should.match /thanks.*beautiful/i # *evil grin*
  end
end