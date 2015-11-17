module Api
  module V1
    class  Post < ActiveRecord::Base
      validates :image_url, presence: true
      validates :latitude, presence: true
      validates :longitude, presence: true
      validates :title, presence: true

      belongs_to :user
    end
  end
end
