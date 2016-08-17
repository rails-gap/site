class Admin::UsersController < ApplicationController
  include DefaultCrud

  before_action :authenticate_user!
  before_action :admin_only?
  before_action :load_personnel_managers, only: [:new, :edit]

  def roles
    load_entity_object_by_id
    @roles = User.available_role_names
  end

  def update_roles
    load_entity_object_by_id
    update_user_roles
  end

  private

  def entity_parameters
    params
      .require(:user)
      .permit(:name, :last_name, :email, :position_id, :level, :personnel_manager_id,
        :employee_type, :location, :active)
  end

  def load_entity_object_by_id
    @entity_object = entity.find(params[:user_id])
  end

  def load_all_entity_objects
    @all_entity_objects = entity.includes(:personnel_manager, :subordinates, :position)
  end

  def load_personnel_managers
    @personnel_managers = @entity_object ? other_personnel_managers : all_personnel_managers
  end

  def all_personnel_managers
    User.active.ordered.personnel_managers
  end

  def other_personnel_managers
    all_personnel_managers.reject { |user| user == @entity_object }
  end

  def update_user_roles
    params[:roles].each do |role, value|
      value == 'true' ? @entity_object.add_role(role) : @entity_object.remove_role(role)
    end
  end

end
