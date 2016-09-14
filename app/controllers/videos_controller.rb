class VideosController < ApplicationController
  add_breadcrumb 'Videos', :videos_path

  before_action :authenticate_user!

  autocomplete :video, :name, full: true

  def index
    @videos = Video.active.all.includes(:user).paginate(page: params[:page])
  end

  def show
    @video = Video.active.find(params[:id])
    add_breadcrumb @video.name, video_path(@video)
  end

  def search
    @videos = Video.active.where(search_param).paginate(page: params[:page])
  end

  private

  def search_param
    ['lower(name) like ?', "%#{params[:search].downcase}%"]
  end
end
