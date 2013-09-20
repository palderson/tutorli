require 'spec_helper'

describe Payment do
  before do
    @payment = FactoryGirl.create(:payment, :purchased_at => DateTime.new(2012, 10, 1).utc)
  end
  it "is retrievable" do
    Payment.first.should == @payment
  end
  
  
  describe "with several at different dates" do
    before do
      @pub_payment = FactoryGirl.create(:publisher_payment)
      @other = FactoryGirl.create(:payment, :purchased_at => DateTime.new(2012, 12, 1).utc)
      @another = FactoryGirl.create(:payment, :purchased_at => DateTime.new(2012, 12, 1).utc)
    end    
    
    it "can be found by month" do
      Payment.for_month(10).for_year(2012).first.should == @payment
      Payment.for_month(12).for_year(2012).first.should == @other
    end
    
    it "adds up the payments for a month" do
      Payment.for_month(12).for_year(2012).sum(:price_cents).should == 1000
    end
    
  end
end
