module Api::Controllers::Todos
  class Create
    include Api::Action

    params do
      required(:text).filled
    end

    def initialize(interactor: CreateTodo.new)
      @interactor = interactor
    end

    def call(params)
      result = @interactor.call(params)

      if result.successful?
        status 201, JSON.dump(data: result.todo.to_hash)
      else
        status 201, JSON.dump(errors: result.errors + params.error_messages)
      end
    end
  end
end