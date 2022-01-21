# frozen_string_literal: true

begin
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new
# rubocop:disable Lint/SuppressedException
rescue LoadError
end
# rubocop:enable Lint/SuppressedException
