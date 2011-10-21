require 'rubygems'
require 'rake/gempackagetask'

spec = Gem::Specification.new do |s|
  s.name = "github_post_receive_server"
  s.version = "0.0.2"
  s.platform = Gem::Platform::RUBY
  s.has_rdoc = true
  s.extra_rdoc_files = ["README", "LICENSE", 'TODO']
  s.summary = "A post commit handler server for GitHub, built on Rack"
  s.description = s.summary
  s.author = "James Tucker"
  s.email = "jftucker@gmail.com"
#  s.homepage = "http://code.ra66i.org/github_post_receive_server"

  s.add_dependency "rack"

  s.require_path = 'lib'
  #s.autorequire = 'github_post_receive_server'

  s.files = %w(LICENSE README Rakefile TODO) +
            Dir.glob("{bin,lib,specs}/**/*")

  s.bindir = 'bin'
  s.executables = %w[
    github_post_receive_server
    github_post_receive_server.ru
  ]
  s.default_executable = 'github_post_receive_server'
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

desc "install the rubygem"
task :install => [:package] do
  sh %{sudo gem install pkg/#{spec.name}-#{spec.version}}
end

desc "run all bacon specs"
task :spec do
  sh %{bacon spec/**/*_spec.rb}
end
task :test => :spec

desc "start server (main executable)"
task :start do
  sh %{bin/github_post_receive_server}
end

desc "start server under thin (rackup)"
task :thin do
  sh %{thin -R bin/github_post_receive_server.ru -p 9001 start}
end

desc "remove pkg files"
task :clean do
  rm_rf 'pkg'
end

desc "run specs"
task :default => :spec