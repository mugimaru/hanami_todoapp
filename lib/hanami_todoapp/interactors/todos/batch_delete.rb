require 'hanami/interactor'
module Todos
  class BatchDelete
    include Hanami::Interactor

    def initialize(repo: TodoRepository.new)
      @repo = repo
    end

    def call(params)
      @repo.todos.where(id: params[:ids]).delete
    end

    private

      def valid?(params)
        params.valid?
      end
  end
end