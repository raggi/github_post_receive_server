Gem::Specification.new("github_post_receive_server", "0.0.2") do |s|
  s.extra_rdoc_files = ["README.md", "LICENSE", 'TODO']
  s.summary = "A post commit handler server for GitHub, built on Rack"
  s.description = s.summary
  s.author = "James Tucker"
  s.email = "jftucker@gmail.com"
  s.homepage = "https://github.com/raggi/github_post_receive_server"

  s.add_dependency "rack"
  s.add_development_dependency "bacon"

  s.files = %w(LICENSE README Rakefile TODO) + Dir.glob("{bin,lib,specs}/**/*")

  s.bindir = 'bin'
  s.executables = %w[
    github_post_receive_server
    github_post_receive_server.ru
  ]
  s.default_executable = 'github_post_receive_server'
end
