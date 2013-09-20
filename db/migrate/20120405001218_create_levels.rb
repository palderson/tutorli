class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.integer :number

      t.timestamps
    end
  end
end
