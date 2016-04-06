class Api::ProductsController < ApplicationApiController
  def index
    @products = lender.products
  end

  def show
    @product = lender.products.find(params[:id])
  end

protected
  def lender
    Lender.find(params[:lender_id])
  end
end
