#!/usr/bin/env rackup
begin
  require 'rubygems'
  require 'github_post_receive_server'
rescue LoadError
  require File.dirname(__FILE__) + '/../lib/github_post_receive_server'
end

use Rack::CommonLogger
use Rack::Lint
run GithubPostReceiveServer::RackApp.new