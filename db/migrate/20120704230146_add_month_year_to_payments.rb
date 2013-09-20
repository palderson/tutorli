class AddMonthYearToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :month, :integer
    add_column :payments, :year, :integer
    
    add_index :payments, :month
    add_index :payments, :year
  end
end
