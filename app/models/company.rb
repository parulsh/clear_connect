class Company < ApplicationRecord
  
  has_many :users

  enum package: [:silver, :gold, :diamond]


end
