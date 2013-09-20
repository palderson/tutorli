class CreatePublisherPayments < ActiveRecord::Migration
  def change
    create_table :publisher_payments do |t|
      t.integer   :user_id
      t.integer   :price_cents
      t.datetime  :purchased_at
      t.datetime  :due_date
      t.boolean   :paid
      t.datetime  :paid_at
      t.integer   :enrolment_id
      t.string    :paypal
      t.timestamps
    end
  end
end
