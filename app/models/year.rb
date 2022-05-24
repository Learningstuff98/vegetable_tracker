class Year < ApplicationRecord
  belongs_to :user
  validates_length_of :year_number, minimum: 4, maximum: 4
end
