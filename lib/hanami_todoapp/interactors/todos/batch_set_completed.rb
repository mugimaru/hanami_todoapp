require 'hanami/interactor'
module Todos
  class BatchSetCompleted
    include Hanami::Interactor

    def initialize(repo: TodoRepository.new)
      @repo = repo
    end

    def call(params)
      @repo.todos.where(id: params[:ids]).update(completed: params[:completed])
    end

    private

      def valid?(params)
        params.valid?
      end
  end
end