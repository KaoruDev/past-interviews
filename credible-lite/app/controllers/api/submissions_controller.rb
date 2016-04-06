class Api::SubmissionsController < ApplicationApiController
  def create
    @submission = Submission.create!(create_params)
  end

  def show
    @submission = Submission.find(params[:id])
  end

protected
  def create_params
    params.permit(
      :name,
      :phone,
      :address,
      :ssn,
      :income,
      :credit_score,
      :amount
    )
  end
end
