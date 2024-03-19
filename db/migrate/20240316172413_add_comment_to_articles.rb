class AddCommentToArticles < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :comment, :string
  end
end
