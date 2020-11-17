# frozen_string_literal: true
# adds indices for email in the users table, and enforces uniqueness
class AddIndexToUsersEmail < ActiveRecord::Migration[6.0]
  def change
    add_index(:users, :email, unique: true)
  end
end
