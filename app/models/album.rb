class Album < ApplicationRecord
  validates :year, numericality: { greater_then: 1000, less_than: 3000 }
  belongs_to :band, foreign_key: :band_id
  has_many :tracks, dependent: :destroy
end
