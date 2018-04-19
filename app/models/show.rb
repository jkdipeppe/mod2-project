class Show < ApplicationRecord
  belongs_to :band
  belongs_to :venue
  has_many :tickets, dependent: :destroy
  has_many :guests, through: :tickets


  def ticket_sales
    self.tickets.map{|ticket| ticket.price}.reduce(:+)
  end

  def profit
    ticket_sales - venue.cost
  end

  def popularity
    tickets.count
  end
end
