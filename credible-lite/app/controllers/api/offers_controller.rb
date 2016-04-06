class Api::OffersController < ApplicationApiController
  def index
    @offers = submission.offers.includes(:lender)
  end

protected
  def submission
    Submission.find(params[:submission_id])
  end
end
