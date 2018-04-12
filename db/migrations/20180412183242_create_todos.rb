Hanami::Model.migration do
  change do
    create_table :todos do
      primary_key :id
      column :text, String, null: false
      column :completed, :boolean, default: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
