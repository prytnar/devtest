class PricingController < ApplicationController
  def evaluate_target
  	@calculator = Pricing::Calculator.new(params).valid?

  	if @calculator.valid?
  		render json: [1,2,3]
  	else
  		render json: @panel_provider.errors, status: :unprocessable_entity
  	end
  end
end
