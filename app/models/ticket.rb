class Ticket < ApplicationRecord
  belongs_to :guest
  belongs_to :show


end
