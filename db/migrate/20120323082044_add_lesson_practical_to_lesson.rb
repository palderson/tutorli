class AddLessonPracticalToLesson < ActiveRecord::Migration
  def change
    add_column :lessons, :lesson_practical, :text

  end
end
