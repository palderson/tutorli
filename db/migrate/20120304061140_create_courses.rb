class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string  :course_name
      t.string  :course_category
      t.text    :course_overview,    :limit => nil
      t.text    :tutor_bio,          :limit => nil
      t.text    :expected_results,   :limit => nil
      t.integer :number_of_lessons
      t.integer :level_id
      t.integer :price_cents
      t.integer :category_id
      t.integer :publisher_id
      t.string  :youtube_thumb

      t.timestamps
    end
  end
end
