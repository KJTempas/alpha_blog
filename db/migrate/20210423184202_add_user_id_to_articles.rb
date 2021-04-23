class AddUserIdToArticles < ActiveRecord::Migration[6.1]
  def change
    #what you want to do :to which table, :name of new column, :data type
    add_column :articles, :user_id, :int
  end
end
