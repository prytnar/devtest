module Pricing
	module Processor
		class PanelOne < Struct.new(:source)
			delegate :read, to: :source
			PATTERN = /[a]+/

			def price
				visible_text.scan(PATTERN).size
			end

			private

			def visible_text
				Nokogiri::HTML(read).at('body').inner_text
			end
		end
	end
end