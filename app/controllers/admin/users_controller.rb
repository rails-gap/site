class Admin::UsersController < ApplicationController
  include DefaultCrud

  before_action :load_personnel_managers, only: [:new, :edit]

  private

  def entity_parameters
    params
      .require(:user)
      .permit(:name, :last_name, :email, :position_id, :level, :personnel_manager_id,
        :employee_type, :location, :active)
  end

  def load_delete_entity_object
    @entity_object = entity.find(params[:user_id])
  end

  def load_all_entity_objects
    @all_entity_objects = entity.includes(:personnel_manager, :subordinates, :position)
  end

  def load_personnel_managers
    @personnel_managers = @entity_object ? other_personnel_managers : all_personnel_managers
  end

  def all_personnel_managers
    User.active.ordered.select { |user| user.has_role?(:personnel_manager) }
  end

  def other_personnel_managers
    all_personnel_managers.reject { |user| user == @entity_object }
  end

end
