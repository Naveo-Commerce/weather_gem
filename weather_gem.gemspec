lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'version.rb'

Gem::Specification.new do |spec|
  spec.name          = "weather_gem"
  spec.version       = Weather::WEATHER_CLIENT_VERSION
  spec.authors       = ["Naveo dev"]
  spec.email         = [""]
  spec.description   = "A weather API client"
  spec.summary       = spec.description
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.required_ruby_version = "> 2.6"

  spec.files         = %w(README.md Rakefile) + Dir.glob("{doc,lib}/**/*")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]


  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = ''
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end


  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", '~> 11.3'
  spec.add_development_dependency "rspec", '~> 3'
  spec.add_development_dependency 'yard', '~> 0.9'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'rest-client'
  spec.add_development_dependency 'rubocop', '~> 0.52'
  spec.add_development_dependency 'rubocop-rspec', '~> 1.22'
  spec.add_development_dependency 'rubocop-checkstyle_formatter', '~> 0.3'
  spec.add_development_dependency 'simplecov', '~> 0.16'

  spec.add_dependency 'rest-client', '~> 2.0'
  spec.add_dependency 'multi_json', '~> 1.12'
end
