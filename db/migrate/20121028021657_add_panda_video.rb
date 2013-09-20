class AddPandaVideo < ActiveRecord::Migration
  def change
    add_column :lessons, :panda_video_id, :string
  end
end
