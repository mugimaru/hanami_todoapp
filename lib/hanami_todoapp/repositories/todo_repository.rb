class TodoRepository < Hanami::Repository
  self.relation = :todos

  def active
    todos.where(completed: false).order { created_at.desc }
  end
end
