class Draw < ApplicationRecord
	has_many :results, class_name: 'DrawResult'
end
