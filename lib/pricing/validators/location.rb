module Pricing
	module Validators
		class Location < ActiveModel::Validator
			def validate(record)
				attr = 'locations'
				value = record.locations

		  	if value.is_a?(Array)
					record.errors.add attr, 'locations should have id and panel_size' unless value.all? do |e|
						e.valid?
					end
		  	else
		  		record.errors.add attr, 'locations should be array' 
		  	end		
			end
		end
	end
end