class Guest < ApplicationRecord
  has_many :tickets, dependent: :destroy
  has_many :shows, through: :tickets

end
