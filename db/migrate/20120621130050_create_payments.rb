class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer   :user_id
      t.integer   :enrolment_id
      t.datetime  :purchased_at
      t.integer   :price_cents
      t.timestamps
    end
  end
end
