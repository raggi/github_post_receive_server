#!/usr/bin/env rackup
begin
  require 'rubygems'
  require 'github_post_commit_server'
rescue LoadError
  require File.dirname(__FILE__) + '/../lib/github_post_commit_server'
end

use Rack::CommonLogger
use Rack::Lint
run GithubPostCommitServer::RackApp.new