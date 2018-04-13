# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }

resources :todos, only: [:index, :create, :update, :delete]
options '/*', to: ->(env) { [204, Api::CORS_HEADERS, []] }