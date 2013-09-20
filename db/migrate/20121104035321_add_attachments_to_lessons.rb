class AddAttachmentsToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :file_url, :string
  end
end
