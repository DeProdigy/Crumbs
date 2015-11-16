require 'rails_helper'

RSpec.describe 'Post create', type: :request do
  context 'with good params' do
    let(:user) { Api::V1::User.create(username: 'someone') }
    let(:post_params) {
      { user_id: user.id, title: 'brush', image_url: 'google.com', latitude: '30.000', longitude: '-50.000'}
    }

    it 'creates a Post' do
      post '/api/v1/posts', post: post_params

      expect(response.status).to eql 201
    end
  end

  context 'with bad post params' do
    let(:user) { Api::V1::User.create(username: 'someone') }
    let(:post_params) { { user_id: user.id, image_url: '' } }
    let(:api_response) { JSON.parse(response.body) }

    let(:expected_error) do
      {
        "error" =>
          {
            "image_url" => ["can't be blank"],
            "latitude"=>["can't be blank"],
            "longitude"=>["can't be blank"],
            "title"=>["can't be blank"]
          }
      }
    end

    it 'does not create a Post' do
      post '/api/v1/posts', post: post_params

      expect(response.status).to eql 401
      expect(api_response).to eql expected_error
    end
  end

  context 'with bad user params' do
    let(:post_params) { { user_id: '', image_url: 'google.com' } }
    let(:api_response) { JSON.parse(response.body) }
    let(:expected_error) { {'error' => 'User not found'} }

    it 'does not create a Post' do
      post '/api/v1/posts', post: post_params

      expect(response.status).to eql 404
      expect(api_response).to eql expected_error
    end
  end
end
