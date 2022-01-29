# frozen_string_literal: true

Sequel.migration do
  change do
    create_table(:votes) do
      foreign_key :link_id, :links
      foreign_key :user_id, :users
      index :link_id, concurrently: true, null: false
      index :user_id, concurrently: true, null: false
    end
  end
end
