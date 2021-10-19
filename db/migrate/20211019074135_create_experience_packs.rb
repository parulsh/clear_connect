class CreateExperiencePacks < ActiveRecord::Migration[6.0]
  def change
    create_table :experience_packs do |t|
      t.string :name

      t.timestamps
    end
  end
end
