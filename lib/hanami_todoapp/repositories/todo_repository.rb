class TodoRepository < Hanami::Repository
  self.relation = :todos
end
