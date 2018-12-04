module Api
  module V1
    class BlogsController < ApplicationController
      def index
        blogs = Blog.all
        render json: blogs
      end

      def create
        blog = Blog.new(blog_params)
        tag_list = params[:tags].split(",")
        if blog.save
          blog.save_tags(tag_list)
          render json: "create new blog.\n", status: 200
        else
          render json: "fail to blog.\n", status: 500
        end          
      end

      def show
        blog = Blog.find_by(slug: params[:slug])
        render json: blog, status: 200
      end

      def destroy
        blog = Blog.find(params[:id])
        blog.destroy
      end

      private
        def blog_params
          params.require(:blog).permit(:slug, :title, :heroImg, :body, { :tags=> [] })
        end
    end
  end
end
