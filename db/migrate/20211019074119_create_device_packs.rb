class CreateDevicePacks < ActiveRecord::Migration[6.0]
  def change
    create_table :device_packs do |t|
      t.string :name

      t.timestamps
    end
  end
end
