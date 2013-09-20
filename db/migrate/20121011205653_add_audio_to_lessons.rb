class AddAudioToLessons < ActiveRecord::Migration
  def self.up
    change_table :lessons do |t|
      t.has_attached_file :audio
    end
  end

  def self.down
    drop_attached_file :lessons, :audio
  end
end