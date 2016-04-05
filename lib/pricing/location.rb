module Pricing
  class Location < Struct.new(:id, :panel_size)
  	include ActiveModel::Validations
  	validates_presence_of :id, :panel_size
  end
end