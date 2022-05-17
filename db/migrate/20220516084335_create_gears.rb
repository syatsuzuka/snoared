class CreateGears < ActiveRecord::Migration[6.1]
  def change
    create_table :gears do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.references :users

      t.timestamps
    end
  end
end
