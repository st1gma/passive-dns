require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "passive-dns"
  gem.homepage = "https://rubygems.org/gems/passive-dns"
  gem.license = "MIT"
  gem.summary = %Q{Query passive DNS databases}
  gem.description = %Q{This provides interfaces to various passive DNS databases to do the query and to normalize the responses.  The query tool also allows for recursive queries, using an SQLite3 database to keep state.}
  gem.email = "rubygems@chrislee.dhs.org"
  gem.authors = ["Chris Lee"]
  # Include your dependencies below. Runtime dependencies are required when using your gem,
  # and development dependencies are only needed for development (ie running rake tasks, tests, etc)
  gem.add_runtime_dependency 'json', '> 1.4.3'
  gem.add_runtime_dependency 'sqlite3', '>= 1.3.3'
  gem.signing_key = "#{ENV['HOME']}/bin/ruby/rubygems/gem-private_key.pem"
  gem.cert_chain  = ["#{ENV['HOME']}/bin/ruby/rubygems/gem-public_cert.pem"]
  gem.executables = ["pdnstool"]
  gem.files = FileList["{bin,lib}/**/*"].to_a
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

require 'rcov/rcovtask'
Rcov::RcovTask.new do |test|
  test.libs << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "passive-dns #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
