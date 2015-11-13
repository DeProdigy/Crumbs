require 'rails_helper'

RSpec.describe 'Get all Posts', type: :request do
  context 'when Posts exist' do
    before do
      post1 = Post.create(image_url: 'google.com', latitude: '30.000', longitude: '-50.000')
      post2 = Post.create(image_url: 'yahoo.com', latitude: '40.000', longitude: '-40.000')
    end

    it 'responds with all the Posts' do
      get '/posts'
      posts = JSON.parse(response.body)

      expect(posts.length).to eql 2
      expect(response.status).to eql 200
    end
  end

  context 'when Posts do not exist' do
    it 'responds with an empty array' do
      get '/posts'

      expect(JSON.parse(response.body)).to eql []
      expect(response.status).to eql 200
    end
  end
end
