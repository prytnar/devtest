source = Pricing::Reader.new('http://time.com')
Pricing::Processor::PanelOne.new(source).price

source = Pricing::Reader.new('http://time.com')
Pricing::Processor::PanelThree.new(source).price

source = Pricing::Reader.new('https://ajax.googleapis.com/ajax/services/feed/find?v=1.0&q=news')
Pricing::Processor::PanelTwo.new(source).price


Pricing::Calculator.new(
	country_code: 'PL', 
	target_group_id: 1, 
	locations: ['{"id": 1, "panel_size": 120}', '{"id": 2}']
).valid?