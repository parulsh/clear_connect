class UserController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.current_user_except(current_user)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.skip_some_callbacks = true
    if @user.save
      redirect_to user_index_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_index_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to user_index_path
  end

  private
    def user_params
      params.require(:user).permit(:user_name, :email, :user_id, :company_name, :password, :password_confirmation, :skip_some_callbacks)
    end
end
