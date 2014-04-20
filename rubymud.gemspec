Gem::Specification.new do |s|
  s.name        = 'Ruby Mud'
  s.version     = '0.0.1'
  s.summary     = 'A simple framework for building text based games in Ruby'
  s.date        = '2014-04-20'
  s.description = 'A very simple framework for building text based games in Ruby.'
  s.authors     = ['Rick Carlino']
  s.license     = 'MIT'
  s.email       = 'please-use-github@rickcarlino.com'
  s.homepage    = 'https://github.com/rickcarlino/mud'
  s.files       = ['lib/mud.rb']

  # s.add_runtime_dependency 'dont_have_any'

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'simplecov'
end