# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "mitre-inspec-objects/version"

Gem::Specification.new do |spec|
  spec.name          = "mitre-inspec-objects"
  spec.version       = InspecObjects::VERSION
  spec.authors       = ["Dominik Richter", "Christoph Hartmann", "Aaron Lippold"]
  spec.email         = ["dominik.richter@gmail.com", "chris@lollyrock.com"]
  spec.summary       = "InSpec Objects library"
  spec.description   = "Library that provides an API for programmatically creating InSpec profiles"
  spec.homepage      = "https://github.com/mitre/inspec-objects"
  spec.license       = "Apache-2.0"

  spec.metadata = { "github_repo" => "ssh://github.com/mitre/inspec-objects" }


  spec.files = %w{
    README.md mitre-inspec-objects.gemspec Gemfile
  } + Dir.glob("{lib}/**/*", File::FNM_DOTMATCH).reject { |f| File.directory?(f) }

  spec.require_paths = ["lib"]
  spec.add_dependency "inspec-core"
end
