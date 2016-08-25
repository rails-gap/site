class Admin::MembershipsController < ApplicationController
  include DefaultCrud

  before_action :authenticate_user!
  before_action :admin_only?
  before_action :load_practice, only: [:index, :new, :create, :delete, :destroy]
  before_action :load_users, only: [:new, :edit]

  private

  def entity_parameters
    params
      .require(:membership)
      .permit(:user_id, :practice_id, :lead)
  end

  def load_entity_object_by_id
    @entity_object = entity.find(params[:membership_id])
  end

  def load_all_entity_objects
    @all_entity_objects = entity.where(practice_id: params[:practice_id])
      .includes(:user, :practice)
      .all
  end

  def load_practice
    @practice = Practice.find(params[:practice_id])
  end

  def load_users
    @users = User.active.ordered.reject { |user| @practice.members.include?(user) }
  end

end
