class Admin::PracticesController < ApplicationController
  include DefaultCrud

  before_action :authenticate_user!

  private

  def entity_parameters
    params.require(:practice).permit(:name, :description, :icon)
  end

  def load_entity_object_by_id
    @entity_object = entity.find(params[:practice_id])
  end

end
