# frozen_string_literal: true

Sequel.migration do
  change do
    create_table(:links) do
      primary_key :id
      String :url, unique: true, null: false
      String :description, text: true, null: false
    end
  end
end
