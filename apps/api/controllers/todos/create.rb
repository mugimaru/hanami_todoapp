module Api::Controllers::Todos
  class Create
    include Api::Action

    params do
      required(:text).filled
    end

    def call(params)
      repo = TodoRepository.new
      todo = repo.create(Todo.new(text: params[:text]))
      status 201, JSON.dump(todo.to_hash)
    end
  end
end