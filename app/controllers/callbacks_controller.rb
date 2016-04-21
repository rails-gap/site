class CallbacksController < Devise::OmniauthCallbacksController

  def google_oauth2
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user
      sign_in_and_redirect @user, event: :authentication
    else
      flash[:error] = 'Please Sign in with your GAP Account'
      redirect_to root_path
    end
  end
end
