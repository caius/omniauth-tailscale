# frozen_string_literal: true

require_relative "lib/omniauth-tailscale/version"

Gem::Specification.new do |spec|
  spec.name = "omniauth-tailscale"
  spec.version = Omniauth::Tailscale::VERSION
  spec.authors = ["Caius Durling"]
  spec.email = ["dev@caius.name"]

  spec.summary = "OmniAuth strategy for Tailscale"
  spec.description = spec.summary
  spec.homepage = "https://github.com/caius/omniauth-tailscale"
  spec.license = "MIT"

  spec.required_rubygems_version = ">= 1.3.5"
  # Oldest ruby under support https://www.ruby-lang.org/en/downloads/branches/
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/caius/omniauth-tailscale/blob/main/Changelog.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "omniauth", "~> 2.0"

  spec.add_development_dependency "debug", ">= 1.0.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "standard", "~> 1.3"
end
