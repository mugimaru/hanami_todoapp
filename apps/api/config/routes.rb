# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }

patch '/todos/batch/set_completed', to: "todos/batch#set_completed"
delete '/todos/batch', to: "todos/batch#delete"

resources :todos, only: [:index, :create, :update, :delete]

options '/*', to: ->(env) { [204, Api::CORS_HEADERS, []] }