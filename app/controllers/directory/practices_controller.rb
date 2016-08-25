class Directory::PracticesController < ApplicationController

  before_action :authenticate_user!

  def index
    @practices = Practice.active.ordered.all
  end

  def show
    @practice = Practice.find(params[:id])
  end

end
