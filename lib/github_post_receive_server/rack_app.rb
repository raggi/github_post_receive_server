# 
#  rack_app.rb
#  github_post_commit_server
#
#  Example Rack app for http://github.com/guides/post-receive-hooks
#  
#  Created by James Tucker on 2008-05-11.
#  Copyright 2008 James Tucker
# 

require 'rubygems'
require 'rack'
require 'json'

module GithubPostReceiveServer
  class RackApp
    GO_AWAY_COMMENT = "Be gone, foul creature of the internet."
    THANK_YOU_COMMENT = "Thanks! You beautiful soul you."

    # This is what you get if you make a request that isn't a POST with a 
    # payload parameter.
    def rude_comment
      @res.write GO_AWAY_COMMENT
    end

    # Does what it says on the tin. By default, not much, it just prints the
    # received payload.
    def handle_request
      payload = @req.POST["payload"]
      
      return rude_comment if payload.nil?
      
      payload = JSON.parse(payload)
      
      # ... Your code goes here! ...
      system('./pull-script.sh')

      @res.write THANK_YOU_COMMENT
    end

    # Call is the entry point for all rack apps.
    def call(env)
      @req = Rack::Request.new(env)
      @res = Rack::Response.new
      handle_request
      @res.finish
    end
  end
end
