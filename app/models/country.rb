class Country < ApplicationRecord
	has_many :location_groups
	has_and_belongs_to_many :target_groups, -> { where parent_id: nil } # only with the root nodes
	belongs_to :panel_provider
end
