if Rails.env == 'production'
  Stripe.api_key = "PRODUCTION_KEY"
  STRIPE_PUBLIC_KEY = "PRODUCTION_PUBLIC_KEY"
else
  Stripe.api_key = "TEST_PRODUCTION_KEY"
  STRIPE_PUBLIC_KEY = "TEST_PRODUCTION_PUBLIC_KEY"
end
