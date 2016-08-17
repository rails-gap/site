class AuthenticationController < Devise::OmniauthCallbacksController

  def google_oauth2
    if user
      user.active ? authorize : no_authorize('Your account is disabled. Please contact an admin.')
    else
      no_authorize('Please sign in with your GAP account.')
    end
  end

  private

  def user
    @user ||= find_user_by_provider || find_user_by_email
  end

  def find_user_by_provider
    User.where(provider: auth.provider, uid: auth.uid).first
  end

  def find_user_by_email
    User.where(email: auth.info.email).first
  end

  def auth
    @auth ||= request.env['omniauth.auth']
  end

  def authorize
    update_user
    sign_in_and_redirect user, event: :authentication
  end

  def update_user
    user.provider = auth.provider
    user.uid = auth.uid
    user.password = Devise.friendly_token[0, 20]
    user.picture = auth.extra.raw_info.picture
    user.image = auth.info.image
    user.save
  end

  def no_authorize(message)
    flash[:error] = message
    redirect_to root_path
  end

end
