class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :username
      t.string :email
      t.integer :market_id
      t.text :description

      t.timestamps
    end
  end
end
