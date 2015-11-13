class  Post < ActiveRecord::Base
  validates :image_url, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true

  belongs_to :user
end
