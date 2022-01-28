# frozen_string_literal: true

Sequel.migration do
  change do
    alter_table(:links) do
      add_foreign_key :user_id, :users
      add_index :user_id, concurrently: true, null: false
    end
  end
end
