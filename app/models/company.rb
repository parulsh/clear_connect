class Company < ApplicationRecord

  enum package: [:bronze, :silver, :gold, :platinum]

  validates :name, :host, presence: true
end
