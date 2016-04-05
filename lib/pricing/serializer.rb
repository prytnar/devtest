module Pricing
	class Serializer
		def to_json
			[
  			{
					country: 'UK', price: Pricing::Processor::PanelTwo.new(Pricing::Reader.new('https://ajax.googleapis.com/ajax/services/feed/find?v=1.0&q=news')).price  				
  			},
  			{
					country: 'PL', price: Pricing::Processor::PanelOne.new(Pricing::Reader.new('http://time.com')).price
				}
  		]
		end
	end
end