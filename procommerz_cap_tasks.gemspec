# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'procommerz_cap_tasks/version'

Gem::Specification.new do |spec|
  spec.name          = "procommerz_cap_tasks"
  spec.version       = ProcommerzCapTasks::VERSION
  spec.authors       = ["Mikhail Urinson"]
  spec.email         = ["mike@mobiquest.com"]
  spec.summary       = %q{Procommerz capistrano tasks}
  spec.description   = %q{Procommerz capistrano tasks}
  spec.homepage      = "https://github.com/procommerz/procommerz-cap-tasks"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"

  spec.add_dependency 'capistrano', '~> 3.1'
  spec.add_dependency 'capistrano-bundler', '~> 1.1'
  spec.add_dependency 'rvm-capistrano'
  spec.add_dependency 'capistrano-rvm'
  spec.add_dependency 'dump'
end
