require 'spec_helper'

describe Enrolment do
  describe 'with valid attributes' do
    before do
      @enrolment = FactoryGirl.create(:enrolment)
    end
    it 'calculates publisher_payment correctly' do
      @enrolment.less_commision(Money.new(500)).to_f.should be_within(0.001).of(3.55)
    end
  end
end
