# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: embedrb 0.2.3 ruby lib

Gem::Specification.new do |s|
  s.name = "embedrb"
  s.version = "0.2.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["liris"]
  s.date = "2016-02-23"
  s.description = "a ruby port of Embed.js"
  s.email = "liris.pp@gmail.com"
  s.extra_rdoc_files = [
    "LICENSE",
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "embedrb.gemspec",
    "lib/embedrb.rb",
    "lib/embedrb/audio/embed_audio.rb",
    "lib/embedrb/base.rb",
    "lib/embedrb/embed.rb",
    "lib/embedrb/embed_gmap.rb",
    "lib/embedrb/embed_open_graph.rb",
    "lib/embedrb/embed_url.rb",
    "lib/embedrb/image/embed_flickr.rb",
    "lib/embedrb/image/embed_images.rb",
    "lib/embedrb/image/embed_instagram.rb",
    "lib/embedrb/utils.rb",
    "lib/embedrb/version.rb",
    "lib/embedrb/video/embed_ted.rb",
    "lib/embedrb/video/embed_ustream.rb",
    "lib/embedrb/video/embed_video.rb",
    "lib/embedrb/video/embed_youtube.rb",
    "test/helper.rb",
    "test/test_embedrb.rb"
  ]
  s.homepage = "http://github.com/liris/embedrb"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.5"
  s.summary = "a ruby port of Embed.js"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 2.0.1"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
    else
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<jeweler>, ["~> 2.0.1"])
      s.add_dependency(%q<simplecov>, [">= 0"])
    end
  else
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<rdoc>, ["~> 3.12"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<jeweler>, ["~> 2.0.1"])
    s.add_dependency(%q<simplecov>, [">= 0"])
  end
end

