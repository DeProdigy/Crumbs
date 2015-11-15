class AddTittleToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :title, :string, default: '', null: false
  end
end
