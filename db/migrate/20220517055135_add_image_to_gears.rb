class AddImageToGears < ActiveRecord::Migration[6.1]
  def change
    add_column :gears, :img_url, :string
  end
end
