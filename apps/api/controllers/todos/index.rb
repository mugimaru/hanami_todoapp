module Api::Controllers::Todos
  class Index
    include Api::Action

    def call(params)
      repo = TodoRepository.new
      todos = repo.active.to_a

      self.format = :json
      status 201, JSON.dump(data: todos.map(&:to_hash))
    end
  end
end