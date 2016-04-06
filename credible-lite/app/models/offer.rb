include Finance

class Offer < ActiveRecord::Base
  belongs_to :submission
  belongs_to :product
  has_one :lender, :through => :product

  before_save do
    # define the rate and amortization (see finance gem)
    rate = Rate.new((self.apr.to_f / 100), :apr, :duration => self.term)
    amortization = Amortization.new(self.submission.amount.to_f, rate)

    # calculate the attriutes of this offer
    self.monthly_payment = BigDecimal(amortization.payment.abs.to_s)
    self.total_cost = BigDecimal(amortization.payments.sum.abs.to_s)
    self.total_interest = BigDecimal(amortization.interest.sum.to_s)
  end
end
