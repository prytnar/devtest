module Pricing
	module Processor
		class PanelThree < Struct.new(:source)
			delegate :read, to: :source


			def price
				0
			end

			private

		end
	end
end