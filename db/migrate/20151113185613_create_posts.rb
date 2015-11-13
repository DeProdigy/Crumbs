class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :image_url, default: '', null: false
      t.string :latitude, default: '', null: false
      t.string :longitude, default: '', null: false
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
