require File.expand_path("../lib/axiomus_api/version", __FILE__)

Gem::Specification.new do |s|
  s.name = "axiomus_api"
  s.version = ::AxiomusApi::VERSION
  s.authors = ["Kinderly LTD"]
  s.email = ["nuinuhin@gmail.com"]
  s.homepage = "https://github.com/kinderly/axiomus_api"

  s.summary = %q{A wrapper for Axiomus API}
  s.description = %q{This gem provides a Ruby wrapper over Axiomus API.}
  s.license = "MIT"

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {spec}/*`.split("\n")
  s.require_paths = ["lib"]

  s.add_dependency('nokogiri', '~>1.6')
  s.add_dependency('barby', '~>0.5')
  s.add_dependency('chunky_png', '~>1.3')
end
