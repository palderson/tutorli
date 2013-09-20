class AddPublisherPaymentIdToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :publisher_id, :integer
    add_column :payments, :publisher_payment_id, :integer
    add_column :payments, :publisher_price_cents, :integer
    add_index :payments, [:publisher_id, :publisher_payment_id]
    add_index :payments, :publisher_price_cents
  end
end
