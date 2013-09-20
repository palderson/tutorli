class PublisherPayment < ActiveRecord::Base
  belongs_to :user
  has_many :payments
  
  monetize :price_cents, :allow_nil => true

  def original_price
    enrolment.course.price
  end
end
