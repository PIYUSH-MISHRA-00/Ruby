class Patient < ApplicationRecord
  validates :first_name, :last_name, :age, :phone, presence: true
end
