module Api::Controllers::Todos
  class Update
    include Api::Action

    params do
      required(:id).filled(:int?)
      optional(:text).filled(:str?)
      optional(:completed).filled(:bool?)
    end

    def call(params)
      return status(400) unless params.valid?

      repo = TodoRepository.new
      todo_params = { text: params[:text], completed: params[:completed] }.compact

      todo = repo.update(params[:id], todo_params)

      status 201, JSON.dump(todo.to_hash)
    end
  end
end