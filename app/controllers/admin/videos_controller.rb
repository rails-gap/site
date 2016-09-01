class Admin::VideosController < ApplicationController
  include DefaultCrud

  before_action :authenticate_user!
  before_action :content_admin_access?
  before_action :load_practices, only: [:new, :edit]
  before_action :load_users, only: [:new, :edit]

  private

  def entity_parameters
    params.require(:video).permit(:name, :url, :description, :active, :tags, :practice_id, :user_id)
  end

  def load_entity_object_by_id
    @entity_object = entity.find(params[:video_id])
  end

  def load_all_entity_objects
    @all_entity_objects = entity.includes(:user, :practice).order(:name)
  end

  def load_practices
    @practices = Practice.all
  end

  def load_users
    @users = User.active.ordered
  end

end
