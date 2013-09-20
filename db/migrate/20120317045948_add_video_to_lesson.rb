class AddVideoToLesson < ActiveRecord::Migration
  def self.up
  	add_column :lessons, :video_file_name, 	:string
  	add_column :lessons, :video_type,			  :string
  	add_column :lessons, :video_file_size,	:integer
  	add_column :lessons, :video_updated_at,	:datetime
  end

  def self.down
  	remove_column :lessons, :video_file_name
  	remove_column :lessons, :video_type
  	remove_column :lessons, :video_file_size
  	remove_column :lessons, :video_updated_at
  end
end
