module Pricing
	module Processor
		class PanelTwo < Struct.new(:source)
			delegate :read, to: :source
			PATTERN = /<b>/i

			def price
				entries_data.to_s.scan(PATTERN).size
			end

			private

			def entries_data
				source_json.fetch('responseData').fetch('entries')
			end

			def source_json
				JSON.parse(plain_content)
			end

			def plain_content
				source.read.read
			end
		end
	end
end