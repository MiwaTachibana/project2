class UsersController < ApplicationController
  before_action :set_user, only: [:show, :about, :edit, :update, :destroy]
  before_action :authorize, only: [:show, :about]

  def index
    @users = User.all.order('id ASC')
  end

 def about
   
 end

  def new
    @user = User.new
  end

  def create
    @user = User.create( user_params )
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end
end

private
    def user_params
     params.require(:user).permit( :name, :image, :email, :password, :password_confirmation)
  end


