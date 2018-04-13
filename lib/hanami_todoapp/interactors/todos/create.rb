require 'hanami/interactor'

module Todos
  class Create
    include Hanami::Interactor

    expose :todo

    def initialize(repo: TodoRepository.new)
      @repo = repo
    end

    def call(params)
      @todo = @repo.create(Todo.new(text: params[:text]))
    end

    private

      def valid?(params)
        params.valid?
      end
  end
end