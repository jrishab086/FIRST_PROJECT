class AddAdminToArticles < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :admin, :boolean, default: false
  end
end
