class Year < ApplicationRecord
  belongs_to :user
  has_many :crop_types
  has_rich_text :notes
  validates_length_of :year_number, minimum: 4, maximum: 4
end
