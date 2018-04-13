module Api::Controllers::Todos
  class Update
    include Api::Action

    params do
      required(:id).filled(:int?)
      optional(:text).filled(:str?)
      optional(:completed).filled(:bool?)
    end

    def initialize(interactor: ::Todos::Update.new)
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