module Api
  module V1
    class PostSerializer < ActiveModel::Serializer
      attributes  :id,
                  :username,
                  :title,
                  :image_url,
                  :latitude,
                  :longitude,
                  :updated_at,
                  :created_at

      def username
        object.user.username
      end
    end
  end
end
