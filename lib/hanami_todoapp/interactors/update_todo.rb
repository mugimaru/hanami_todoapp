require 'hanami/interactor'

class UpdateTodo
  include Hanami::Interactor

  expose :todo

  def initialize(repo: TodoRepository.new)
    @repo = repo
  end

  def call(params)
    puts params.to_hash.inspect
    todo_params = {
      text: params[:text],
      completed: params[:completed]
    }.compact

    if todo_params.empty?
      error! "Nothing to update, params are empty"
    end

    @todo = @repo.update(params[:id], todo_params)
    unless @todo
      error! "Unable to find Todo with id #{params[:id]}"
    end
  end

  private

    def valid?(params)
      params.valid?
    end
end