class AddPasswordDigestToUsers < ActiveRecord::Migration[6.1]
  def change #add column to users table, column name, column type
    add_column :users, :password_digest, :string
  end
end
