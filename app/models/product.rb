class Product < ActiveRecord::Base
  belongs_to :vendor
  has_one :sale

  validates :name, presence: true
end
