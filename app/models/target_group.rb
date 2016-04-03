class TargetGroup < ApplicationRecord
	has_and_belongs_to_many :countries
  has_many :subgroups, class_name: 'TargetGroup', foreign_key: 'parent_id'
  belongs_to :parent_group, class_name: 'TargetGroup', foreign_key: 'parent_id'	
  belongs_to :panel_provider

  def self.all_for_country_code(country_code)
    joins(:countries).
    where('UPPER(countries.country_code) = UPPER(?)', country_code).
    where('countries.panel_provider_id = target_groups.panel_provider_id').
    map(&:get_descedendants_with_self)
  end    

  def get_descedendants_with_self
  	get_subgroups.reverse
  end

  private

  def get_subgroups(group = self, result = [])
    return result.push(group) if group.subgroups.empty?
    group.subgroups.each do |subgroup|
      get_subgroups(subgroup, result)
    end
    result.push group
  end
end


