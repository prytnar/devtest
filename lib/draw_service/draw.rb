module DrawService

	class Draw
		attr_reader :draw_type

		def initialize(draw_type: )
			@draw_type = draw_type
		end

		def call
			draw_type.perform
			persist
		end

		def persist
			::Draw.create(
				draw_type: draw_type.type,
				results: draw_type.results.map { |result|
					::DrawResult.new(value: result)	
				}
			)
		end
	end
end