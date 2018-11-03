class PostsController < ApplicationController
  before_action :set_post!, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    @post = Post.find(params[:id])
    @post.title = post_params[:title]
    @post.category =post_params[:category]
    @post.content = post_params[:content]
      if @post.nil? || !@post.valid?
        render :edit
      elsif @post.valid?
        @post.save
        redirect_to post_path(@post.id)
      end
  end

  private

  def post_params
    params.permit(:category, :content, :title)
  end

  def set_post!
    @post = Post.find(params[:id])
  end
end
