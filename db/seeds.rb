# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

panel_providers = PanelProvider.create([
	{ code: 'ABB' },
	{ code: 'Schneider Electric' },
	{ code: 'Siemens' }
])

countries = []
countries << Country.create(country_code: 'PL', panel_provider: panel_providers[0])
countries << Country.create(country_code: 'UK', panel_provider: panel_providers[1])
countries << Country.create(country_code: 'US', panel_provider: panel_providers[2])

locations_groups = []
locations_groups << Location.create([{ name: 'Krakow' }, { name: 'Malopolskie' }, { name: 'Sławka' }, { name: '19/14'}])
locations_groups << Location.create([{ name: 'Brighton' }, { name: 'United Kingdom' }, { name: 'Queen Mary st' }, { name: '24'}])
locations_groups << Location.create([{ name: 'Las Vegas' }, { name: 'California' }, { name: 'Cassino st' }, { name: '1'}])
locations_groups << Location.create([{ name: 'Albigowa' }, { name: 'Podkarpackie' }, { name: '0000'}])	

LocationGroup.create(name: 'Address 0', country: countries[0], panel_provider: panel_providers[0], locations: locations_groups[0])
LocationGroup.create(name: 'Address 1', country: countries[1], panel_provider: panel_providers[1], locations: locations_groups[1])
LocationGroup.create(name: 'Address 2', country: countries[2], panel_provider: panel_providers[2], locations: locations_groups[2])
LocationGroup.create(name: 'Address 3', country: countries[0], panel_provider: panel_providers[0], locations: locations_groups[0])

target_0 = TargetGroup.create(name: 'Solar energy branch', countries: countries, panel_provider: panel_providers[0])
target_00 = TargetGroup.create(name: 'Electricity plants', parent_group: target_0)
target_000 = TargetGroup.create(name: 'Private investors', parent_group: target_00)
target_001 = TargetGroup.create(name: 'Government', parent_group: target_00)
TargetGroup.create(name: 'Ziutek Kowalski', parent_group: target_000)


target_1 = TargetGroup.create(name: 'B Branch', countries: countries, panel_provider: panel_providers[1])
target_11 = TargetGroup.create(name: 'B Sub branch', parent_group: target_1)
TargetGroup.create(name: 'B Some customer', parent_group: target_11)

target_2 = TargetGroup.create(name: 'C Branch', countries: countries, panel_provider: panel_providers[2])
target_22 = TargetGroup.create(name: 'C Sub branch', parent_group: target_2)
target_222 = TargetGroup.create(name: 'C Sub Sub branch', parent_group: target_22)
target_2222 = TargetGroup.create(name: 'C Sub Sub Sub branch', parent_group: target_222)
TargetGroup.create(name: 'C Customer', parent_group: target_2222)

