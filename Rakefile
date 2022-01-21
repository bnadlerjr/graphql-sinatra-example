# frozen_string_literal: true

# Import any external rake tasks
Dir.glob('tasks/*.rake').each { |r| import r }

task default: 'spec'

desc 'Run CI checks'
task ci: %w[spec rubocop flog flay]
