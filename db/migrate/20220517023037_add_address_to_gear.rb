class AddAddressToGear < ActiveRecord::Migration[6.1]
  def change
    add_column :gears, :address, :string
  end
end
