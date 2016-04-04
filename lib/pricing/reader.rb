require 'open-uri'

module Pricing
	class Reader < Struct.new(:url)

		def read			
			open url
		end

		private

		def agent
		end
	end
end
