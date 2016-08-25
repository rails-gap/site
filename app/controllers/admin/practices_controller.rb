class Admin::PracticesController < ApplicationController
  include DefaultCrud

  before_action :authenticate_user!
  before_action :admin_only?
  before_action :load_practice_leads, only: [:new, :edit]

  private

  def entity_parameters
    params.require(:practice).permit(:name, :description, :icon, :practice_lead_id, :active)
  end

  def load_entity_object_by_id
    @entity_object = entity.find(params[:practice_id])
  end

  def load_practice_leads
    @practice_leads = User.active.ordered.practice_leads
  end

end
