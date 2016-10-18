Gem::Specification.new do |s|
  s.name        = 'log_manager'
  s.version     = '0.0.1'
  s.date        = '2016-10-18'
  s.summary     = "I will make your debug and management of logs a happy time for you!"
  s.description = "A log manager gem"
  s.authors     = ["Giancarlo Guzman"]
  s.email       = 'giancarloguzo@gmail.com'
  s.files       = ["lib/log_manager.rb","lib/generators/log_manager/install_generator.rb","lib/generators/log_manager/execute_generator.rb"]
  s.homepage    = 'https://github.com/GianGuzmanOki/log_manager'
  s.license     = 'MIT'

  s.add_dependency 'rake', '>=11.2.2'
end