# -*- encoding: utf-8 -*-

$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')
require 'troll/version'

Gem::Specification.new do |s|
  s.name = "troll"
  s.version = Troll::VERSION
  s.authors = ["scudco"]
  s.email = "adamandersonis@gmail.com"
  s.files = Dir["README.md", "lib/**/*"]
  s.homepage = "http://github.com/scudco/troll"
  s.require_path = "lib"
  s.rubyforge_project = "troll"
  s.rubygems_version = "1.6.2"
  s.description = "Trolling is a art"
  s.summary = "Trolling for fun and profit"
end
