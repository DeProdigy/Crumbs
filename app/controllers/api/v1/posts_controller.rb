module Api
  module V1
    class PostsController < ApplicationController
      def index
        posts = Post.includes(:user).last(20)
        render json: posts, each_serializer: PostSerializer, root: false
      end

      def create
        user = User.find_by(id: post_params[:user_id])

        if user
          post =  Post.create(post_params)

          if post.valid?
            render json: post, status: 201
          else
            render json: { 'error' => post.errors.messages }, status: 401
          end
        else
          render json: { 'error' => 'User not found' }, status: 404
        end
      end

      private

        def post_params
           params.require(:post).permit(:user_id, :title, :image_url, :latitude, :longitude)
        end
    end
  end
end
