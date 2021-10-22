class CreateMeetingExperiencePacks < ActiveRecord::Migration[6.0]
  def change
    create_table :meeting_experience_packs do |t|
      t.integer :meeting_id
      t.integer :experience_pack_id

      t.timestamps
    end
  end
end
