class ProfileController < ApplicationController
  def edit
    @profile = current_user
  end

  def update
    if current_user.update_attributes(params[:profile_update_params])
      redirect_to settings_path, notice: 'Profile updated successfully'
    else
      render 'edit'
    end
  end

  def change_password
  end

  def update_password
    if current_user.update_attributes(params[:password_params])
      redirect_to settings_path, notice: 'Profile updated successfully'
    else
      render 'edit'
    end
  end

  private

  def profile_update_params
    params.require(:user).permit(:name)
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end