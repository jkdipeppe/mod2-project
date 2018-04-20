class Band < ApplicationRecord
  has_many :shows
  has_many :venues, through: :shows
  has_secure_password
  validates :name, presence: true
  validates :genre, presence: true
  validates :bandmates, presence: true
  validates :bio, presence: true
  validates :picture, presence: true
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
    if num == nil
      0
    end
  end

  def average_age
    s = shows.select{|show| show.guests.count > 0}
    s.map{|show| show.guests.map{|guest| guest.age}.reduce(:+)/show.guests.count}.reduce(:+)/s.count
  end

  def self.popular(n)
    Band.all.sort_by {|band| band.tickets_sold}[0..n]
  end

  def vip_ga_ratio
    ga = shows.all.map{|show| show.tickets.select{|t| t.ticket_type == "General Admission"}.count}.reduce(:+)
    vip = shows.all.map{|show| show.tickets.select{|t| t.ticket_type == "VIP"}.count}.reduce(:+)
    # [[ga, "GA"], [vip, "VIP"]]
    (vip/ga).to_f
  end

  def shows_by_profit

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


  def tour_route
    shows.sort_by{|show| show.date}.map{|s| s.venue.location}
  end

  def tour_schedule
    shows.sort_by{|show| show.date}.map{|s| "#{s.venue.location}"}
  end
end
