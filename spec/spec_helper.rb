$TESTING=true
$:.push File.join(File.dirname(__FILE__), '..', 'lib')
require "bacon"
require 'github_post_commit_server'