class Admin::PositionsController < ApplicationController
  include DefaultCrud

  before_action :authenticate_user!

  private

  def entity_parameters
    params.require(:position).permit(:name)
  end

  def load_entity_object_by_id
    @entity_object = entity.find(params[:position_id])
  end

end
