class UsersController < ApplicationController

  before_action :load_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(create_user_params)

    @user.password = @user.password_confirmation = SecureRandom.hex[0..8]

    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update_attributes(update_user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.mark_as_deleted!
    redirect_to users_path, alert: "User <#{@user.email}> deleted successfully."
  end

  private

  def create_user_params
    params.require(:user).permit(:email)
  end

  def update_user_params
    params.require(:user).permit(:email)
  end

  def load_user
    @user = User.find(params[:id])
  end
end