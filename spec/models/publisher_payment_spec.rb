require 'spec_helper'

describe PublisherPayment do
  before do
    @publisher = FactoryGirl.create(:user)
    @to_pay = FactoryGirl.build(:payment)
    @to_pay.publisher = @publisher
    @to_pay.save!
    @publisher_payment = FactoryGirl.create(:publisher_payment)
  end
  
  describe "before we pay them" do
    it "has an outstanding balance" do
      @publisher.potential_payments.outstanding.sum(:price_cents).should == 500
    end
  end
  
  describe "when we pay them" do
    before do
      @publisher.pay_publisher
    end
    it "updates the publisher on a payment" do
      @to_pay.publisher.should == @publisher
      @to_pay.publisher_payment.should == @publisher_paymment
    end
    
    it "decreases the outstanding balance" do
      @publisher.potential_payments.outstanding.sum(:price_cents).should == 0
    end
  end
    
end
