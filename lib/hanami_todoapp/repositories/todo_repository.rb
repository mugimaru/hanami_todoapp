class TodoRepository < Hanami::Repository
  self.relation = :todos

  def newest_first
    todos.order { created_at.desc }
  end
end
