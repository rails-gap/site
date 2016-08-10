class Admin::PracticesController < ApplicationController
  include DefaultCrud

  private

  def entity_parameters
    params.require(:practice).permit(:name)
  end

  def load_delete_entity_object
    @entity_object = entity.find(params[:practice_id])
  end

end
