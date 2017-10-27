class Band < ApplicationRecord
  has_many :albums, foreign_key: :band_id
end
