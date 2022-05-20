class AddColumnsToAccount < ActiveRecord::Migration[6.1]
  def change
    add_column :accounts, :phone, :varchar
    add_column :accounts, :email, :varchar
    add_column :accounts, :company, :varchar
    add_column :accounts, :summary, :text
  end
end
