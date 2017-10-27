class Album < ApplicationRecord
  belongs_to :band, foreign_key: :band_id
end
