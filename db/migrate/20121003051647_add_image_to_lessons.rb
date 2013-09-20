class AddImageToLessons < ActiveRecord::Migration
  def self.up
    change_table :lessons do |t|
      t.has_attached_file :image
    end
  end

  def self.down
    drop_attached_file :lessons, :image
  end
end
