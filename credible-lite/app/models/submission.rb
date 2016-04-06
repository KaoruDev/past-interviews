class Submission < ActiveRecord::Base
  has_many :offers

  after_create do
    Product.all.each do |product|
      if product.eligible?(self)
        self.offers << product.make_offer
      end
    end
  end
end
