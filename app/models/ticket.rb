class Ticket < ApplicationRecord
  belongs_to :guest
  belongs_to :show

  validate :venue_capactiy

  def venue_capactiy
    if self.show
      v = Venue.find_by(id: self.show.venue_id)
      if v.capacity <= show.tickets.count
        errors.add(:over_capacity, "This venue is sold out")
      end
    end
  end

end
