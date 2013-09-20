require 'open-uri'

class Course < ActiveRecord::Base
  has_many :enrolments
  has_many :users, :through => :enrolments
  has_many :lessons, :order => "position", :dependent => :destroy
  has_many :exercises, :through => :lessons

  has_attached_file :image,
      :bucket => 'image_bio',
      :styles => { :bio => "262x174!", :thumb => "150x150" },
      :storage => :s3, :s3_credentials => "#{Rails.root}/config/amazon_s3.yml",
      :path => "user/:attachment/:style/:id.:extension"

  has_attached_file :course_image,
      :bucket => 'course_image',
      :styles => { :medium => "262x174!", :thumb => "150x150" },
      :storage => :s3, :s3_credentials => "#{Rails.root}/config/amazon_s3.yml",
      :path => "course/:attachment/:style/:id.:extension"

  accepts_nested_attributes_for :lessons, allow_destroy: true

  belongs_to :category
  belongs_to :level

  belongs_to :publisher, :class_name => "User"

  validates_presence_of :course_name, :course_overview, :tutor_bio, :expected_results, :price
  validates_presence_of :category_id

  scope :latest, order("created_at DESC")
  scope :is_published, where(published: true)

  Haml::Template.options[:format] = :xhtml

  PRICE_RANGES = [(0..10), (11..25), (26..40), (41..60), (60..100), (101..500)]

  monetize :price_cents, :allow_nil => true

	def Course.prices_for_display
		PRICE_RANGES.collect do |price_ranges|
			{
				label: "$#{price_ranges.min.to_s}-$#{price_ranges.max.to_s}",
				min: price_ranges.min,
				max: price_ranges.max
			}
		end
	end

	attr_accessor :stripe_card_token

  def save_with_payment
    if valid?
      customer = Stripe::Customer.create(description: email, plan: plan_id, card: stripe_card_token)
      self.stripe_customer_token = customer.id
      save!
    end
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false
  end
end
