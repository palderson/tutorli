class AddVimeoToLesson < ActiveRecord::Migration
  def up
    add_column :lessons, :vimeo_id, :string
  end

  def down
    remove_column :lessons, :vimeo_id
  end
end