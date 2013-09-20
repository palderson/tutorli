class Exercise < ActiveRecord::Base
	belongs_to :lesson
	has_many :users, :through => :course
end
