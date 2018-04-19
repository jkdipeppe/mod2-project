class Band < ApplicationRecord
  has_many :shows
  has_many :venues, through: :shows
  has_secure_password
  validates :name, presence: true
  validates :genre, presence: true
  validates :bandmates, presence: true
  validates :bio, presence: true
  validates :image, presence: true
  validates :username, presence: true
  validates :password_digest, presence: true

  def earnings
    show_total = 0
    venue_cost = 0
    self.shows.each do |show|
      show.tickets.each do |ticket|
        show_total += ticket.price
      end
      venue_cost += show.venue.cost
    end
    show_total-venue_cost
  end

  def tickets_sold
    num = self.shows.map {|show| show.tickets.count}.reduce(:+)
    if num = nil
      0
    end
end

  def self.popular(n)
    Band.all.sort_by {|band| band.tickets_sold}[0..n]
  end

  def self.highest_grossing
    name = ""
    curr_earnings = 0
    Band.all.each do |band|
      if band.earnings > curr_earnings
        name = band.name
        curr_earnings = band.earnings
      elsif band.earnings == curr_earnings
        name += "and #{band.name}"
      end
    end
    name
  end

end
