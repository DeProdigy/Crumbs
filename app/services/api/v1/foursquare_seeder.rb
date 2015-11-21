module Api
  module V1
    class FoursquareSeeder
      def initialize(args)
        @sw = args[:sw]
        @ne = args[:ne]
        @client_id = args[:client_id]
        @client_secret = args[:client_secret]
        @api_version = args[:api_version]
        @current_location = args[:current_location]
      end

      def seed
        venues.map { |venue| create_venue(venue) }.compact
      end


      private
        attr_reader :client_id, :client_secret, :api_version, :current_location, :sw, :ne

        def client
          Foursquare2::Client.new(
            client_id: client_id,
            client_secret: client_secret,
            api_version: api_version
          )
        end

        def venues
          client.search_venues(ll: current_location).venues
          # client.search_venues(sw: sw, ne: ne).venues
        end

        def venue_info(venue_id)
          client.venue(venue_id)
        end

        def create_venue(venue)
          VenueCreator.new( venue_info(venue.id) ).create
        end
    end
  end
end
