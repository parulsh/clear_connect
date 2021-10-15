class AddFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :full_name, :string
    add_column :users, :company_id, :integer
    add_column :users, :user_name, :string
  end
end
