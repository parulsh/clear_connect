class CreateMeetings < ActiveRecord::Migration[6.0]
  def change
    create_table :meetings do |t|
      t.string :topic
      t.string :password
      t.datetime :start_time
      t.time :duration
      t.string :time_zone
      t.integer :user_id
      t.string :status
      t.integer :device_pack_id
      t.text :attendees, array: true, default: []
      t.string :alternate_host

      t.timestamps
    end
  end
end
