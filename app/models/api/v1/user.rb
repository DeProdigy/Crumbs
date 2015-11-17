module Api
  module V1
    class  User < ActiveRecord::Base
      validates :username, presence: true

      has_many :posts
    end
  end
end
