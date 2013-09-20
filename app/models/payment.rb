class Payment < ActiveRecord::Base
  belongs_to :user
  belongs_to :enrolment
  belongs_to :publisher, :class_name => "User"
  belongs_to :publisher_payment
  
  monetize :price_cents, :allow_nil => true
  monetize :publisher_price_cents, :as => "publisher_price", :allow_nil => true
  
  scope :for_month, lambda {|month| where(:month => month)}
  scope :for_year, lambda {|year| where(:year => year)}
  
  before_save :update_month_year
  
  scope :outstanding, where(:publisher_payment_id => nil)
  
  scope :outstanding_amount, outstanding.sum(:publisher_price_cents)
  
  THRESHOLD_AMOUNT = 2000
  
  def update_month_year
    date = self.purchased_at
    self.month = date.month
    self.year = date.year
  end
end
