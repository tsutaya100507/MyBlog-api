module Api
  module V1
    class BlogsController < ApplicationController
      def index
        blogs = Blog.all
        render json: blogs
      end

      def create
        blog = Blog.new(blog_params)
        if blog.save
          render json: "create new blog.\n", status: 200
        else
          render json: "fail to blog.\n", status: 500
        end          
      end

      def show
        blog = Blog.find(params[:id])
        render json: blog, status: 200
      end

      def destroy
        blog = Blog.find(params[:id])
        blog.destroy
      end

      private
        def blog_params
          params.require(:blog).permit(:slug, :title, :heroImg, :body)
        end
    end
  end
end
