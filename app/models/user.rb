class User < ActiveRecord::Base
  has_many :enrolments
  has_many :courses, :through => :enrolments
  has_many :published_courses, :class_name => "Course", :foreign_key => "publisher_id"
  has_many :payments
  has_many :potential_payments, :class_name => "Payment", :foreign_key => "publisher_id"
  has_many :publisher_payments
  has_many :lessons, :through => :courses
  has_many :exercises, :through => :lessons

  accepts_nested_attributes_for :courses

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username
  attr_accessible :paypal

  def pay_publisher
    to_pay = self.potential_payments.outstanding.all
    total_amount = self.potential_payments.outstanding.sum(:price_cents)
    pub_pay = self.publisher_payments.build(:price_cents => total_amount)
    pub_pay.paid_at = Time.now.utc
    pub_pay.save!

    to_pay.each do |payment|
      payment.publisher_payment = pub_pay
      payment.save!
    end
  end

  def enrol_in_course(course, is_test = false)
    enrolment = self.enrolments.build
    enrolment.course = course
    enrolment.save!
    enrolment.save_with_payment(is_test)
    self.courses << course
    self.save!
  end

  def publish(course)
    self.published_courses << course
    self.save
  end

  def amount_owed
    self.potential_payments.outstanding.sum(:publisher_price_cents)
  end

end
