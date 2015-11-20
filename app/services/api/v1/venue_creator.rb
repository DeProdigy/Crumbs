module Api
  module V1
    class VenueCreator
      def initialize(venue_data)
        @venue_data = venue_data
      end

      def create
        begin
          Post.create(
            user: user,
            image_url: image_url,
            title: title,
            latitude: latitude,
            longitude: longitude
          )
        rescue
          nil
        end
      end

      private

        attr_reader :venue_data

        def user
          User.all.sample
        end

        def image_url
          image_info = venue_data.photos.groups.first.items.first
          "#{image_info.prefix}#{image_info.width}x#{image_info.height}#{image_info.suffix}"
        end

        def title
          venue_data.categories.first.name
        end

        def latitude
          venue_data.location.lat
        end

        def longitude
          venue_data.location.lng
        end
    end
  end
end
