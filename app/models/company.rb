class Company < ApplicationRecord

  enum package: [:silver, :gold, :diamond]

end
