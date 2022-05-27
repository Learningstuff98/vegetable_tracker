class CropType < ApplicationRecord
  belongs_to :year
  validates :name, presence: true
  has_rich_text :notes
end
