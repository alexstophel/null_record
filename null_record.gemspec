# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "null_record/version"

Gem::Specification.new do |spec|
  spec.name = "null_record"
  spec.version = NullRecord::VERSION
  spec.authors = ["Alex Stophel"]
  spec.email = ["alexstophel@gmail.com"]
  spec.summary = "Enables ActiveRecord FinderMethods to return Null Objects."
  spec.homepage = "https://github.com/alexstophel/null_record"
  spec.license = "MIT"

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]


  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "codeclimate-test-reporter"
  spec.add_development_dependency "pry", "~> 0.10.3"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "sqlite3", "~> 1.3", ">= 1.3.11"
end
