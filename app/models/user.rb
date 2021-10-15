class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attr_accessor :skip_some_callbacks
  
  belongs_to :company
  validates :user_name, presence: true, uniqueness: true
  
  before_validation :set_password
  skip_callback :validation, :before, :set_password, unless: :skip_some_callbacks

  scope :current_user_except, -> (user) { where.not(id: user) } 

  private
    def set_password 
      self.password = SecureRandom.hex(4)
    end
end
