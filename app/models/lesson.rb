class Lesson < ActiveRecord::Base
	belongs_to :course
	acts_as_list :scope => :course
	has_many :exercises
	validates_presence_of :lesson_name, :lesson_overview, :lesson_practical

  scope :ordered, order("position ASC")

  has_attached_file :image,
      :bucket => 'lesson_image',
      :styles => { :medium => "262x174!", :thumb => "150x150" },
      :storage => :s3, :s3_credentials => "#{Rails.root}/config/amazon_s3.yml",
      :path => "lesson/:attachment/:style/:id.:extension"

  def panda_video
    unless panda_video_id.blank?
      @panda_video ||= Panda::Video.find(panda_video_id)
    end
  end

  def cached_thumbnail
    if self.image_file_name.blank?
      thumb = self.thumbnail_from_vimeo
      if thumb
        self.image = open(thumb)
        self.save
        return self.image
      end
    else
      return self.image
    end
  end
end
