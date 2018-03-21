class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(create_user_params)

    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
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
    redirect_to :index
  end
end