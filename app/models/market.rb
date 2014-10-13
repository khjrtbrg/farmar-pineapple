class Market < ActiveRecord::Base
  has_many :vendors
  has_many :products, through: :vendors
  geocoded_by :location  
  after_validation :geocode
end
