class Directory::ProfilesController < ApplicationController
  add_breadcrumb 'Profiles', :directory_profiles_path

  before_action :authenticate_user!

  def index
    @users = User.active.ordered.all
  end

  def show
    @user = User.find(params[:id])
    add_breadcrumb @user.full_name, directory_profile_path(@user)
  end

end
