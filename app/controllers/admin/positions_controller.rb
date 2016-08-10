class Admin::PositionsController < ApplicationController
  include DefaultCrud

  private

  def entity_parameters
    params.require(:position).permit(:name)
  end

  def load_delete_entity_object
    @entity_object = entity.find(params[:position_id])
  end

end
