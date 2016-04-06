class Api::LendersController < ApplicationApiController
  def index
    @lenders = Lender.all
  end

  def show
    @lender = Lender.find(params[:id])
  end
end
