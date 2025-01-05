# frozen_string_literal: true

require_relative "lib/activejob_sqs_cron/version"

Gem::Specification.new do |spec|
  spec.name = "activejob_sqs_cron"
  spec.version = ActivejobSqsCron::VERSION
  spec.authors = ["kakubin"]
  spec.email = ["wetsand.wfs@gmail.com"]

  spec.summary = "activejob cron"
  spec.description = "activejob cron"
  spec.homepage = "https://github.com/kakubin/activejob_sqs_cron"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport"
  spec.add_dependency "fugit"
  spec.add_development_dependency "aws-activejob-sqs"
end
