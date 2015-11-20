class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :image_url, default: '', null: false
      t.float :latitude, default: 0, null: false
      t.float :longitude, default: 0, null: false
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
