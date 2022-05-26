class CropType < ApplicationRecord
  belongs_to :year
  validates :name, presence: true
end
