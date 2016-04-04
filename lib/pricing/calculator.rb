module Pricing
	class Calculator < ActiveModel
	  include ActiveModel::Validations

	  attr_accessor :first_name, :last_name

	  validates_each :first_name, :last_name do |record, attr, value|
	    record.errors.add attr, 'starts with z.' if value.to_s[0] == ?z
	  end

	  
	end
end 
