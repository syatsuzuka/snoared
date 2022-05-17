class AddReferencesToGears < ActiveRecord::Migration[6.1]
  def change
    remove_column :gears, :users_id, :integer
    add_reference :gears, :user, null: false, foreign_key: true
  end
end
