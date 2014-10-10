class AddLocationInfoMarkets < ActiveRecord::Migration
  def change
    add_column(:markets, :location, :string)
  end
end
