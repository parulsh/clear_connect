class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :host
      t.string :name
      t.integer :package

      t.timestamps
    end
  end
end
