class PricingController < ApplicationController

  def evaluate_target
  	@calculator = Pricing::Calculator.new(params)

  	if @calculator.valid?
  		render json: @calculator.to_json
  	else
  		render json: @calculator.errors, status: :unprocessable_entity
  	end
  end
end
