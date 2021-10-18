class User < ApplicationRecord
  rolify

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attr_accessor :skip_some_callbacks

  validates :user_name, presence: true, uniqueness: true
  
  before_validation :set_password
  skip_callback :validation, :before, :set_password, unless: :skip_some_callbacks

  scope :current_user_except, -> (user) { where.not(id: user) } 

  private
    def set_password 
      self.password = SecureRandom.hex(4)
    end
end
