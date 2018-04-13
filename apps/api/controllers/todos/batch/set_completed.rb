module Api::Controllers::Todos
  module Batch
    class SetCompleted
      include Api::Action

      params do
        required(:completed).filled(:bool?)
        required(:ids).filled(:array?)
      end

      def initialize(interactor: ::Todos::BatchSetCompleted.new)
        @interactor = interactor
      end

      def call(params)
        result = @interactor.call(params)

        if result.successful?
          status 201, JSON.dump(result: :ok)
        else
          status 201, JSON.dump(errors: result.errors + params.error_messages)
        end
      end
    end
  end
end