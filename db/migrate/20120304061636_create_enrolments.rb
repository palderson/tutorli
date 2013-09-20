class CreateEnrolments < ActiveRecord::Migration
  def change
    create_table :enrolments do |t|
      t.integer :user_id
      t.integer :course_id
      t.timestamps
    end
  end
end
