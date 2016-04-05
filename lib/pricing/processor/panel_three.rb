module Pricing
	module Processor
		class PanelThree < Struct.new(:source)
			delegate :read, to: :source

			def price
				get_all_nodes(Nokogiri::HTML(read)).size / 100
			end

			private
			# I've used method described here:
			# http://stackoverflow.com/questions/10076190/nokogiri-recursively-get-all-children
			def get_all_nodes(xo)
				result = []
				xo.traverse {|node| result << node }
				result
			end
		end
	end
end