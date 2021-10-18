class Company < ApplicationRecord

  enum package: [:silver, :gold, :diamond]

  validates :name, :host, presence: true
end
