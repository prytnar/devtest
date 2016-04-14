module DrawService
	class Lotek
		attr_reader :results, :type, :pool_size, :pool, :qty

		def initialize(pool_size:, qty: , type:)
			@pool_size = pool_size
			@qty = qty
			@type = type
			@results = []
		end

		def perform
			initialize_pool
			qty.times {
				results << pool.sample #should pop from pool 
			}
		end

		def initialize_pool
			@pool = (1..pool_size).to_a
		end
	end
end