class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :current_password, :occupation, :about, :avatar)
  end
end
