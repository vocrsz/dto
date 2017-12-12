require_relative 'lib/dto/version'

Gem::Specification.new do |s|
  s.name        = 'dto'
  s.version     = DTO::VERSION
  s.summary     = "Data Transfer Object"
  s.description = "Ruby simple DTO class"
  s.authors     = ["Droid Labs", "VocrSz"]
  s.email       = 'vocrsz@gmail.com'
  
  s.files       = `git ls-files`.split($/)
  s.test_files  = s.files.grep(%r{^(spec)/})

  s.add_development_dependency "byebug"
  s.add_development_dependency "rspec"
  
  s.homepage    = 'https://github.com/vocrsz/dto'
  s.license     = 'MIT'
end