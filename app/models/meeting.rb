class Meeting < ApplicationRecord
  include Duration

  validates :topic, :password, presence: true
  
  belongs_to :user
  belongs_to :device_pack
  has_many :meeting_experience_packs
  has_many :experience_packs, through: :meeting_experience_packs

  scope :completed, ->(user) { where("start_time < ? and user_id = ?", Date.today, user.id) }
  scope :upcoming, ->(user) { where("start_time >= ? and user_id = ?", Time.now, user.id)} 
  scope :earlier, -> { where("start_time < ?", Date.today) }
end
