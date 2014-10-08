class Vendor < ActiveRecord::Base
  belongs_to :market
  has_many :products

  def self.authenticate(username)
    user = Vendor.find_by(username: username)
    user ? user : nil
  end
end
