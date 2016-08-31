class Directory::PracticesController < ApplicationController
  add_breadcrumb 'Practices', :directory_practices_path

  before_action :authenticate_user!

  def index
    @practices = Practice.active.ordered.all
  end

  def show
    @practice = Practice.find(params[:id])
    add_breadcrumb @practice.name, directory_practice_path(@practice)
  end

end
