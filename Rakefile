# encoding: utf-8

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

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'embedrb/version'
require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://guides.rubygems.org/specification-reference/ for more options
  gem.name = "embedrb"
  gem.version = EmbedRb::VERSION
  gem.homepage = "http://github.com/liris/embedrb"
  gem.license = "MIT"
  gem.summary = %Q{a ruby port of Embed.js}
  gem.description = %Q{a ruby port of Embed.js}
  gem.email = "liris.pp@gmail.com"
  gem.authors = ["liris"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

desc "Code coverage detail"
task :simplecov do
  ENV['COVERAGE'] = "true"
  Rake::Task['test'].execute
end

task :default => :test

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  # version = File.exist?('VERSION') ? File.read('VERSION') : ""
  version = EmbedRb::VERSION

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "embedrb #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
