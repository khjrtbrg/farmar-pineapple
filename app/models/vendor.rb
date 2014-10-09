class Vendor < ActiveRecord::Base
  belongs_to :market
  has_many :products, dependent: :destroy
  has_many :sales, dependent: :destroy

  validates :username, presence: true
  validates :email, presence: true
  validates :description, presence: true

  def self.authenticate(username)
    user = Vendor.find_by(username: username)
    user ? user : nil
  end
end
