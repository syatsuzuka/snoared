class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.references :user, null: false, foreign_key: false

      t.timestamps
    end
  end
end
