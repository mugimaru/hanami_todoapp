module Api::Controllers::Todos
  module Batch
    class Delete
      include Api::Action

      params do
        required(:ids).filled(:array?)
      end

      def initialize(interactor: ::Todos::BatchDelete.new)
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