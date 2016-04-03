class Location < ApplicationRecord
	has_and_belongs_to_many :location_groups

	def self.all_for_country_code(country_code)
		joins(:location_groups => :country).
		where('UPPER(countries.country_code) = UPPER(?)', country_code).
		where('location_groups.panel_provider_id = location_groups.panel_provider_id')
	end
end
