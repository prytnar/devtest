module Pricing
	class Calculator
	  include ActiveModel::Validations
		attr_accessor :country_code, :target_group_id, :locations
	  validates_presence_of :country_code, :target_group_id
  	validates_with Validators::Location

	  def initialize(params)
	  	@country_code = params.fetch(:country_code, nil)
	  	@target_group_id = params.fetch(:target_group_id, nil)
	  	@locations = params.fetch(:locations, nil)
	  	if locations
	  		@locations.map! do |location_str|
					h = JSON.parse(location_str).symbolize_keys
					Location.new(h.fetch(:id, nil), h.fetch(:panel_size, nil))
				end
			end
	  end

		def to_json
			[
  			{
					country: 'UK', 
					price: Pricing::Processor::PanelTwo.new(Pricing::Reader.new('https://ajax.googleapis.com/ajax/services/feed/find?v=1.0&q=news')).price  				
  			},
  			{
					country: 'PL', 
					price: Pricing::Processor::PanelOne.new(Pricing::Reader.new('http://time.com')).price
				},
				{
					country: 'US',
					price: Pricing::Processor::PanelThree.new(Pricing::Reader.new('http://time.com')).price
				}
  		]
		end
	end
end 
