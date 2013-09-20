class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.integer :lesson_id
      t.string  :multiple_choice_question
      t.text    :written_question, :limit => nil
      t.text    :practical_exercise, :limit => nil

      t.timestamps
    end
  end
end
