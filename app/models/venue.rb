class Venue < ApplicationRecord
  has_many :shows
  has_many :bands, through: :shows

end
