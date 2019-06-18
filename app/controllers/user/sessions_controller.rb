class User::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  def new

  end

  def create
    super
=begin
   @user = User.new(user_params)
   @user.save

   redirect_to controller: '/searches', action: 'show'
=end
  end

  # DELETE /resource/sign_out
  def destroy
     super
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
