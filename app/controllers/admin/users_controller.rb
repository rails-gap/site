class Admin::UsersController < ApplicationController
  include DefaultCrud

  private

  def entity_parameters
    params
      .require(:user)
      .permit(:email, :name, :employee_type, :location, :position_id, :personnel_manager_id)
  end

  def load_delete_entity_object
    @entity_object = entity.find(params[:user_id])
  end

end
