class Band < ApplicationRecord
  has_many :shows
  has_many :venues, through: :shows
  has_secure_password



  def tour_route
    shows.sort_by{|show| show.date}.map{|s| s.venue.location}
  end

  def tour_schedule
    shows.sort_by{|show| show.date}.map{|s| "#{s.venue.location}"}
  end
end
