class AddPositionToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :position, :integer
    add_column :courses, :position, :integer
  end
end
