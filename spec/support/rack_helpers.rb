# frozen_string_literal: true

require_relative 'rack_matchers'

# Helpers for running Rack-based tests or specs. Decorates normal Rack methods
# with an optional `:as` parameter. If present, the `rack.session` will
# include the value of the given user's ID, effectively signing them in for
# the request.
#
# Example
# ```
# # Find or create a user. You can name the class anything you'd like, the
# # only requirement is that it responds to a `id` method.
# user = User.new(id: 1) # or User.find, etc.
# get '/', as: user
# ```
#
# The above will add a `current_user` to the `rack.session` with a value of
# the user's ID.
#
module RackHelpers
  include Rack::Test::Methods

  %w[get post put patch delete options].each do |type|
    define_method(type) do |uri, params={}, env={}, &block|
      extract_user!(params, env)
      super uri, params, env, &block
    end
  end

  def json_body
    JSON.parse(last_response.body)
  end

  private

  def extract_user!(params, env)
    user = params.delete(:as)
    return unless user

    if env.key?('rack.session')
      env['rack.session'].merge!(current_user: user.id)
    else
      env.merge!({ 'rack.session' => { current_user: user.id } })
    end
  end

  def app
    Sinatra::Application
  end
end
