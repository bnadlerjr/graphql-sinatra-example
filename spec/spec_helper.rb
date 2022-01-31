# frozen_string_literal: true

ENV['DATABASE_URL'] = 'sqlite://db/test.db'
ENV['RACK_ENV'] = 'test'

require 'bcrypt'
BCrypt::Engine.cost = BCrypt::Engine::MIN_COST

require 'simplecov'
SimpleCov.start do
  add_filter '/bin/'
  add_filter '/config/'
  add_filter '/db/migrate/'
  add_filter '/spec/'
  coverage_dir 'tmp/coverage'
end

require_relative '../config/environment'

require 'warning'

# Ignore all warnings in Gem dependencies
Gem.path.each { |path| Warning.ignore(//, path) }

require 'factory_bot'
require 'pry-byebug'
require 'rack/test'
require 'rspec/graphql_matchers'
require 'rspec_sequel_matchers'
require 'support/rack_helpers'

# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.around do |example|
    DB.transaction(rollback: :always) { example.run }
  end

  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    FactoryBot.find_definitions
  end

  config.include RackHelpers, type: :request
  config.include RspecSequel::Matchers

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.default_formatter = 'doc' if config.files_to_run.one?
  config.disable_monkey_patching!
  config.example_status_persistence_file_path = 'spec/examples.txt'
  config.filter_run_when_matching :focus
  config.order = :random
  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.warnings = true

  Kernel.srand config.seed
end
