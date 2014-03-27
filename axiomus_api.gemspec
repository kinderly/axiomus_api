require File.expand_path("../lib/axiomus_api/version", __FILE__)

Gem::Specification.new do |s|
  s.name = "axiomus_api"
  s.version = ::AxiomusApi::VERSION
  s.authors = ["Kinderly LTD"]
  s.email = ["nuinuhin@gmail.com"]
  s.homepage = "https://github.com/httplab/axiomus_api"

  s.summary = %q{A wrapper for Axiomus API}
  s.description = %q{This gem provides a Ruby wrapper over Axiomus API.}
  s.license = "MIT"

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {spec}/*`.split("\n")
  s.require_paths = ["lib"]

  s.add_dependency('nokogiri')
  s.add_development_dependency('rspec')
  s.add_development_dependency('coveralls')
end
