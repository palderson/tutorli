class CreateLessons < ActiveRecord::Migration
  def change
    create_table  :lessons do |t|
      t.integer   :lesson_number
      t.string    :lesson_name
      t.text      :lesson_overview, :limit => nil
      t.text      :youtube_id, :limit => nil

      t.timestamps
    end
  end
end
