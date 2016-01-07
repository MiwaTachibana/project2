class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = current_user.posts.build
    # @post = Post.new
  end

  def edit
  end

  def create
    # @post = Post.create( post_params )
    @post = current_user.posts.build(post_params)
    # @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.'}
        format.json { render :show, status: :created, location: @post}
      else
        format.html {render :new}
        format.json {render json: @post.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render action: 'edit'
    end
  end
  #   respond_to do |format|
  #     if @post.update(post_params)
  #       format.html {redirect_to @post, notice: 'Post was successfully updated.'}
  #       format.json {render :show, status: :ok, location: @post}
  #     else
  #       format.html {rendr :edit}
  #       format.json {render json: @post.errors, status: :unprocessable_entity}
  #     end
  #   end
  # end

  def destroy
    @post.destroy
    redirect_to posts_url
    
  #   respond_to do |format|
  #     format.html {redirect_to posts_url, notice: 'Post was successfully destroyed.'}
  #     format.json {head :no_content}
  # end
end




def authenticate
    unless logged_in?
        flash[:error] = "You must be logged in to access this section of the site"
        redirect_to login_form_url
      end
  end

  def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to posts_path, notice: "You are not authorized to edit this post" if @post.nil?
  end



private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description, :image, :content, :is_completed)
  end
end
