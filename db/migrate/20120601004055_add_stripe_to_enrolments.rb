class AddStripeToEnrolments < ActiveRecord::Migration
  def change
    add_column :enrolments, :stripe_charge_id, :string
    add_column :enrolments, :payment_recipient_id, :integer
  end
end
