class Video < ActiveRecord::Base
  belongs_to :user
  belongs_to :practice

  scope :active, -> { where(active: true) }

  self.per_page = 9

  def presenter
    user.full_name
  end

  def thumbnail
    "http://img.youtube.com/vi/#{video_id}/hqdefault.jpg"
  end

  def embedded_link
    url.gsub!('watch?v=', 'embed/')
  end

  private

  def video_id
    url.split('v=').last.split('?').first
  end

end
