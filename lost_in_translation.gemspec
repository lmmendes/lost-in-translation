# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "lib/lost_in_translation/version"

Gem::Specification.new do |s|
  s.name        = "lost_in_translation"
  s.version     = LostInTranslation::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Luís Mendes"]
  s.email       = ["lmmendes@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{A simple internacionalization management tool with a Sinatra webinterface}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "lost_in_translation"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency 'activesupport', '~> 3.0.0'
  s.add_dependency 'sqlite3'
end
